import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
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
  List<TaskModel> _allTasksList = [];
  List<TaskModel> _toDoTasksList = [];

  void _loadAllTasksList() {
    final String? allTasksString = PreferencesManager().getAllTasks();
    if (allTasksString == null) return;
    final List<dynamic> allTaskListDecode = jsonDecode(allTasksString);
    _allTasksList = allTaskListDecode
        .map((element) => TaskModel.fromJson(element))
        .toList()
        .reversed
        .toList();
  }

  void _loadToDoTasksList() {
      _toDoTasksList = _allTasksList.where((task) => !task.isFinished).toList();
  }

  void _updateTasksList() async {
    final List<TaskModel> updateNormalTasksList = _allTasksList.reversed
        .toList();
    final List<Map<String, dynamic>> updatedTaskList = updateNormalTasksList
        .map((task) => task.toJson())
        .toList();
    await PreferencesManager().setAllTasks(jsonEncode(updatedTaskList));
  }

  @override
  void initState() {
    super.initState();
    _loadAllTasksList();
    _loadToDoTasksList();
  }

  @override
  Widget build(BuildContext context) {
    return _toDoTasksList.isEmpty
        ? const Center(
            child: EmptyTasks(firstMessage: 'There is no to-do tasks'),
          )
        : ListView.builder(
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
                            _updateTasksList();
                            _loadToDoTasksList();
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
