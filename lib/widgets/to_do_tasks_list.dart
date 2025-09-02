import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'empty_tasks.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';

class ToDoTasksList extends StatefulWidget {
  const ToDoTasksList({super.key});

  @override
  State<ToDoTasksList> createState() => _ToDoTasksListState();
}

class _ToDoTasksListState extends State<ToDoTasksList> {
  List<TaskModel> _normalTasksList = [];
  List<TaskModel> _highPriorityTasksList = [];
  List<TaskModel> _allTasksList = [];
  List<TaskModel> _toDoTasksList = [];

  void _loadNormalTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('normal tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    _normalTasksList = taskListDecode
        .map((element) => TaskModel.fromJson(element))
        .toList().reversed.toList();
    _loadToDoTasksList();
  }

  void _loadHighPriorityTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? highPriorityTasksString = prefs.getString(
      'high priority tasks',
    );
    if (highPriorityTasksString == null) return;
    final List<dynamic> highPriorityTaskListDecode = jsonDecode(
      highPriorityTasksString,
    );
    _highPriorityTasksList = highPriorityTaskListDecode
        .map((element) => TaskModel.fromJson(element))
        .toList().reversed.toList();
    _loadToDoTasksList();
  }

  void _loadToDoTasksList() {
    setState(() {
      _allTasksList = [..._highPriorityTasksList, ..._normalTasksList];
      _toDoTasksList = _allTasksList.where((task) => !task.isFinished).toList();
    });
  }

  void _updateNormalTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<TaskModel> updateNormalTasksList = _allTasksList
        .where((task) => !task.isHighPriority)
        .toList().reversed.toList();
    final List<Map<String, dynamic>> updatedTaskList = updateNormalTasksList
        .map((task) => task.toJson())
        .toList();
    await prefs.setString('normal tasks', jsonEncode(updatedTaskList));
  }

  void _updateHighPriorityTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<TaskModel> updateHighPriorityTasksList = _allTasksList
        .where((task) => task.isHighPriority)
        .toList().reversed.toList();
    final List<Map<String, dynamic>> updatedTaskList =
        updateHighPriorityTasksList.map((task) => task.toJson()).toList();
    await prefs.setString('high priority tasks', jsonEncode(updatedTaskList));
  }

  @override
  void initState() {
    super.initState();
    _loadNormalTasks();
    _loadHighPriorityTasks();
  }

  @override
  Widget build(BuildContext context) {
    return _toDoTasksList.isEmpty
        ? const EmptyTasks(firstMessage: 'There is no to-do tasks')
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _toDoTasksList.length,
            itemBuilder: (context, index) {
              return Container(
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
                        onChanged: (value) {
                          setState(() {
                            _toDoTasksList[index].isFinished = value!;
                            if (_toDoTasksList[index].isHighPriority) {
                              _updateHighPriorityTasks();
                              _loadHighPriorityTasks();
                            } else {
                              _updateNormalTasks();
                              _loadNormalTasks();
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
                            taskName: _toDoTasksList[index].taskName,
                          ),
                          _toDoTasksList[index].taskDescription.isNotEmpty
                              ? FinishedTaskDescription(
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
              );
            },
          );
  }
}
