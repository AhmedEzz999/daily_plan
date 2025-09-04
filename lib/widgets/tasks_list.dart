import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
import '../models/task_model.dart';
import 'empty_tasks.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class TasksList extends StatefulWidget {
  const TasksList({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Future<void> _updateTasksList() async {
    final List<TaskModel> updateNormalTasksList = widget.allTasksList.reversed
        .toList();
    final List<Map<String, dynamic>> updatedTaskList = updateNormalTasksList
        .map((task) => task.toJson())
        .toList();
    await PreferencesManager().setAllTasks(jsonEncode(updatedTaskList));
  }

  @override
  Widget build(BuildContext context) {
    return widget.allTasksList.isEmpty
        ? const SliverToBoxAdapter(
            child: EmptyTasks(
              firstMessage: 'No Tasks',
              secondMessage: 'Press + to add new task',
            ),
          )
        : SliverList.builder(
            itemCount: widget.allTasksList.length,
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
                      isFinished: widget.allTasksList[index].isFinished,
                      onChanged: (value) async {
                        setState(() {
                          widget.allTasksList[index].isFinished = value!;
                        });
                        await _updateTasksList();
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.allTasksList[index].isFinished
                            ? FinishedTaskName(
                                taskName: widget.allTasksList[index].taskName,
                              )
                            : UnfinishedTaskName(
                                taskName: widget.allTasksList[index].taskName,
                              ),
                        widget.allTasksList[index].taskDescription.isNotEmpty
                            ? widget.allTasksList[index].isFinished
                                  ? FinishedTaskDescription(
                                      taskDescription: widget
                                          .allTasksList[index]
                                          .taskDescription,
                                    )
                                  : UnfinishedTaskDescription(
                                      taskDescription: widget
                                          .allTasksList[index]
                                          .taskDescription,
                                    )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: widget.allTasksList[index].isFinished
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
