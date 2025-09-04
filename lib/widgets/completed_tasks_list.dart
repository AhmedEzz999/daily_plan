import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
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
  List<TaskModel> _allTasksList = [];
  List<TaskModel> _completedTasksList = [];

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

  void _loadCompletedTasksList() {
    _completedTasksList = _allTasksList
        .where((task) => task.isFinished)
        .toList();
  }

  void _updateTasksList() async {
    final List<TaskModel> updateTasksList = _allTasksList.reversed
        .toList();
    final List<Map<String, dynamic>> updatedTaskList = updateTasksList
        .map((task) => task.toJson())
        .toList();
    await PreferencesManager().setAllTasks(jsonEncode(updatedTaskList));
  }

  @override
  void initState() {
    super.initState();
    _loadAllTasksList();
    _loadCompletedTasksList();
  }

  @override
  Widget build(BuildContext context) {
    return _completedTasksList.isEmpty
        ? const Center(
            child: EmptyTasks(firstMessage: 'There is no completed tasks'),
          )
        : ListView.builder(
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
                      onChanged: (value) async {
                        setState(() {
                          _completedTasksList[index].isFinished = value!;
                          _updateTasksList();
                          _loadCompletedTasksList();
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
