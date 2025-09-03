import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import '../widgets/finished_task_name.dart';
import '../widgets/task_check_box.dart';
import '../widgets/unfinished_task_name.dart';

class HighPriorityTasksView extends StatefulWidget {
  const HighPriorityTasksView({required this.highPriorityTasksList, super.key});
  final List<TaskModel> highPriorityTasksList;

  @override
  State<HighPriorityTasksView> createState() => _HighPriorityTasksViewState();
}

class _HighPriorityTasksViewState extends State<HighPriorityTasksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('High Priority Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.highPriorityTasksList.length,
          itemBuilder: (context, index) => Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: const BoxDecoration(
              color: Color(0xff282828),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                TaskCheckBox(
                  isFinished: widget.highPriorityTasksList[index].isFinished,
                  onChanged: (value) async {
                    setState(() {
                      widget.highPriorityTasksList[index].isFinished = value!;
                    });
                    final prefs = await SharedPreferences.getInstance();
                    final List<Map<String, dynamic>> updatedTaskList = widget
                        .highPriorityTasksList
                        .map((task) => task.toJson())
                        .toList()
                        .reversed
                        .toList();
                    await prefs.setString(
                      'high priority tasks',
                      jsonEncode(updatedTaskList),
                    );
                  },
                ),
                Expanded(
                  child: widget.highPriorityTasksList[index].isFinished
                      ? FinishedTaskName(
                          taskName:
                              widget.highPriorityTasksList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName:
                              widget.highPriorityTasksList[index].taskName,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
