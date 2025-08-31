import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/task_model.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_name.dart';

class HighPriorityTasksList extends StatefulWidget {
  const HighPriorityTasksList({super.key});

  @override
  State<HighPriorityTasksList> createState() => _HighPriorityTasksListState();
}

class _HighPriorityTasksListState extends State<HighPriorityTasksList> {
  List<TaskModel> _highPriorityTasksList = [];

  void _loadHighPriorityTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('high priority tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      _highPriorityTasksList = taskListDecode
          .map((element) => TaskModel.fromJson(element))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadHighPriorityTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  itemCount: _highPriorityTasksList.length,
                  itemBuilder: (context, index) => Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xff282828),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        TaskCheckBox(
                          isFinished: _highPriorityTasksList[index].isFinished,
                          onChanged: (value) async {
                            setState(() {
                              _highPriorityTasksList[index].isFinished = value!;
                            });
                            final prefs = await SharedPreferences.getInstance();
                            final List<Map<String, dynamic>> updatedTaskList =
                                _highPriorityTasksList
                                    .map((task) => task.toJson())
                                    .toList();
                            await prefs.setString(
                              'high priority tasks',
                              jsonEncode(updatedTaskList),
                            );
                          },
                        ),
                        Expanded(
                          child: _highPriorityTasksList[index].isFinished
                              ? FinishedTaskName(
                                  taskName:
                                      _highPriorityTasksList[index].taskName,
                                )
                              : UnfinishedTaskName(
                                  taskName:
                                      _highPriorityTasksList[index].taskName,
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
                  border: Border.all(color: const Color(0xff6E6E6E), width: 2),
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () {},
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
