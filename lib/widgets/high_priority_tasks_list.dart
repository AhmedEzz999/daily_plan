import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../models/preferences_manager.dart';
import '../models/task_model.dart';
import '../views/high_priority_tasks_view.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_name.dart';

class HighPriorityTasksList extends StatefulWidget {
  const HighPriorityTasksList({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  State<HighPriorityTasksList> createState() => _HighPriorityTasksListState();
}

class _HighPriorityTasksListState extends State<HighPriorityTasksList> {
  List<TaskModel> highPriorityTasksList = [];

  void _loadHighPriorityTasksList() {
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
    _loadHighPriorityTasksList();
  }

  @override
  Widget build(BuildContext context) {
    return widget.allTasksList
            .where((task) => task.isHighPriority)
            .toList()
            .isEmpty
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: const BoxDecoration(
              color: Color(0xff282828),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'High Priority Tasks',
                    style: TextStyle(fontSize: 20, color: primaryColor),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: (highPriorityTasksList.length > 4)
                            ? 4
                            : highPriorityTasksList.length,
                        itemBuilder: (context, index) => Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xff282828),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              TaskCheckBox(
                                isFinished:
                                    highPriorityTasksList[index].isFinished,
                                onChanged: (value) async {
                                  setState(() {
                                    highPriorityTasksList[index].isFinished =
                                        value!;
                                    updateTasksList();
                                  });
                                },
                              ),
                              Expanded(
                                child: highPriorityTasksList[index].isFinished
                                    ? FinishedTaskName(
                                        taskName: highPriorityTasksList[index]
                                            .taskName,
                                      )
                                    : UnfinishedTaskName(
                                        taskName: highPriorityTasksList[index]
                                            .taskName,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color(0xff6E6E6E),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HighPriorityTasksView(
                                allTasksList: widget.allTasksList,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            'assets/images/arrow-up-right.svg',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
