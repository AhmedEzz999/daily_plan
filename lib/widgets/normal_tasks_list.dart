import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'empty_tasks.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class NormalTasksList extends StatefulWidget {
  const NormalTasksList({required this.normalTasksList, super.key});
  final List<TaskModel> normalTasksList;

  @override
  State<NormalTasksList> createState() => _NormalTasksListState();
}

class _NormalTasksListState extends State<NormalTasksList> {
  @override
  Widget build(BuildContext context) {
    return widget.normalTasksList.isEmpty
        ? const EmptyTasks(
            firstMessage: 'No Tasks',
            secondMessage: 'Press + to add new task',
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.normalTasksList.length,
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
                      isFinished: widget.normalTasksList[index].isFinished,
                      onChanged: (value) async {
                        setState(() {
                          widget.normalTasksList[index].isFinished = value!;
                        });
                        final prefs = await SharedPreferences.getInstance();
                        final List<Map<String, dynamic>> updatedTaskList =
                            widget.normalTasksList
                                .map((task) => task.toJson())
                                .toList();
                        await prefs.setString(
                          'normal tasks',
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
                        widget.normalTasksList[index].isFinished
                            ? FinishedTaskName(
                                taskName:
                                    widget.normalTasksList[index].taskName,
                              )
                            : UnfinishedTaskName(
                                taskName:
                                    widget.normalTasksList[index].taskName,
                              ),
                        widget.normalTasksList[index].taskDescription.isNotEmpty
                            ? widget.normalTasksList[index].isFinished
                                  ? FinishedTaskDescription(
                                      taskDescription: widget
                                          .normalTasksList[index]
                                          .taskDescription,
                                    )
                                  : UnfinishedTaskDescription(
                                      taskDescription: widget
                                          .normalTasksList[index]
                                          .taskDescription,
                                    )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: widget.normalTasksList[index].isFinished
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
