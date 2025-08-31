import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class ToDoTasksList extends StatefulWidget {
  const ToDoTasksList({super.key});

  @override
  State<ToDoTasksList> createState() => _ToDoTasksListState();
}

class _ToDoTasksListState extends State<ToDoTasksList> {
  List<TaskModel> _toDoNormalTasksList = [];
  List<TaskModel> _toDoHighPriorityTasksList = [];
  List<TaskModel> _toDoTasksList = [];

  void _loadToDoTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('normal tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      _toDoNormalTasksList = taskListDecode
          .map((element) => TaskModel.fromJson(element))
          .where((task) => !task.isFinished)
          .toList();
      _toDoTasksList = _toDoHighPriorityTasksList + _toDoNormalTasksList;
    });
  }

  void _loadToDoHighPriorityTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? highPriorityTasksString = prefs.getString(
      'high priority tasks',
    );
    if (highPriorityTasksString == null) return;
    final List<dynamic> highPriorityTaskListDecode = jsonDecode(
      highPriorityTasksString,
    );
    setState(() {
      _toDoHighPriorityTasksList = highPriorityTaskListDecode
          .map((element) => TaskModel.fromJson(element))
          .where((task) => !task.isFinished)
          .toList();
      _toDoTasksList = _toDoHighPriorityTasksList + _toDoNormalTasksList;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadToDoTasks();
    _loadToDoHighPriorityTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _toDoTasksList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xff282828),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskCheckBox(
                isFinished: _toDoTasksList[index].isFinished,
                onChanged: (value) async {
                  setState(() {
                    _toDoTasksList[index].isFinished = value!;
                  });
                  final prefs = await SharedPreferences.getInstance();
                  final List<Map<String, dynamic>> updatedTaskList =
                      _toDoTasksList.map((task) => task.toJson()).toList();
                  await prefs.setString(
                    _toDoTasksList[index].isHighPriority
                        ? 'high priority tasks'
                        : 'normal tasks',
                    jsonEncode(updatedTaskList),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _toDoTasksList[index].isFinished
                      ? FinishedTaskName(
                          taskName: _toDoTasksList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName: _toDoTasksList[index].taskName,
                        ),
                  _toDoTasksList[index].taskDescription.isNotEmpty
                      ? _toDoTasksList[index].isFinished
                            ? FinishedTaskDescription(
                                taskDescription:
                                    _toDoTasksList[index].taskDescription,
                              )
                            : UnfinishedTaskDescription(
                                taskDescription:
                                    _toDoTasksList[index].taskDescription,
                              )
                      : const SizedBox(),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: _toDoTasksList[index].isFinished
                    ? const Color(0xffA0A0A0)
                    : const Color(0xffC6C6C6),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
