import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
import '../models/task_model.dart';
import '../widgets/finished_task_name.dart';
import '../widgets/task_check_box.dart';
import '../widgets/unfinished_task_name.dart';

class HighPriorityTasksView extends StatefulWidget {
  const HighPriorityTasksView({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  State<HighPriorityTasksView> createState() => _HighPriorityTasksViewState();
}

class _HighPriorityTasksViewState extends State<HighPriorityTasksView> {
  List<TaskModel> highPriorityTasksList = [];

  void _loadHighPriorityTasks() {
    highPriorityTasksList = widget.allTasksList
        .where((task) => task.isHighPriority)
        .toList();
  }

  void updateTasksList() async {
    final List<Map<String, dynamic>> updatedTaskList = widget.allTasksList
        .map((task) => task.toJson())
        .toList()
        .reversed
        .toList();
    await PreferencesManager().setAllTasks(jsonEncode(updatedTaskList));
  }

  @override
  void initState() {
    super.initState();
    _loadHighPriorityTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('High Priority Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: highPriorityTasksList.length,
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
                  isFinished: highPriorityTasksList[index].isFinished,
                  onChanged: (value) async {
                    setState(() {
                      highPriorityTasksList[index].isFinished = value!;
                    });
                    updateTasksList();
                  },
                ),
                Expanded(
                  child: highPriorityTasksList[index].isFinished
                      ? FinishedTaskName(
                          taskName: highPriorityTasksList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName: highPriorityTasksList[index].taskName,
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
