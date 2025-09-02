import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'empty_tasks.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';

class CompletedTasksList extends StatefulWidget {
  const CompletedTasksList({super.key});

  @override
  State<CompletedTasksList> createState() => _CompletedTasksListState();
}

class _CompletedTasksListState extends State<CompletedTasksList> {
  List<TaskModel> _toDoNormalTasksList = [];
  List<TaskModel> _toDoHighPriorityTasksList = [];
  List<TaskModel> _allTasksList = [];
  List<TaskModel> _completedTasksList = [];

  void _loadToDoTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('normal tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    _toDoNormalTasksList = taskListDecode
        .map((element) => TaskModel.fromJson(element))
        .toList();
    _loadCompletedTasksList();
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
    _toDoHighPriorityTasksList = highPriorityTaskListDecode
        .map((element) => TaskModel.fromJson(element))
        .toList();
    _loadCompletedTasksList();
  }

  void _loadCompletedTasksList() {
    setState(() {
      _allTasksList = _toDoHighPriorityTasksList + _toDoNormalTasksList;
      _completedTasksList = _allTasksList
          .where((task) => task.isFinished)
          .toList();
    });
  }

  void _updateNormalTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<TaskModel> updateNormalTasksList = _allTasksList
        .where((task) => !task.isHighPriority)
        .toList();
    final List<Map<String, dynamic>> updatedTaskList = updateNormalTasksList
        .map((task) => task.toJson())
        .toList();
    await prefs.setString('normal tasks', jsonEncode(updatedTaskList));
  }

  void _updateHighPriorityTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<TaskModel> updateHighPriorityTasksList = _allTasksList
        .where((task) => task.isHighPriority)
        .toList();
    final List<Map<String, dynamic>> updatedTaskList =
        updateHighPriorityTasksList.map((task) => task.toJson()).toList();
    await prefs.setString('high priority tasks', jsonEncode(updatedTaskList));
  }

  @override
  void initState() {
    super.initState();
    _loadToDoTasks();
    _loadToDoHighPriorityTasks();
    _loadCompletedTasksList();
  }

  @override
  Widget build(BuildContext context) {
    return _completedTasksList.isEmpty
        ? const Center(
            child: EmptyTasks(firstMessage: 'There is no completed tasks'),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _completedTasksList.length,
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
                      isFinished: _completedTasksList[index].isFinished,
                      onChanged: (value) {
                        setState(() {
                          _completedTasksList[index].isFinished = value!;
                          if (_completedTasksList[index].isHighPriority) {
                            _updateHighPriorityTasks();
                            _loadToDoHighPriorityTasks();
                          } else {
                            _updateNormalTasks();
                            _loadToDoTasks();
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FinishedTaskName(
                          taskName: _completedTasksList[index].taskName,
                        ),
                        _completedTasksList[index].taskDescription.isNotEmpty
                            ? FinishedTaskDescription(
                                taskDescription:
                                    _completedTasksList[index].taskDescription,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: _completedTasksList[index].isFinished
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
