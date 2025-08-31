import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class NormalTaskList extends StatefulWidget {
  const NormalTaskList({super.key});

  @override
  State<NormalTaskList> createState() => _NormalTaskListState();
}

class _NormalTaskListState extends State<NormalTaskList> {
  List<TaskModel> _normalTaskList = [];

  void _loadNormalTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('normal tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      _normalTaskList = taskListDecode
          .map((element) => TaskModel.fromJson(element))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadNormalTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _normalTaskList.length,
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
                isFinished: _normalTaskList[index].isFinished,
                onChanged: (value) async {
                  setState(() {
                    _normalTaskList[index].isFinished = value!;
                  });
                  final prefs = await SharedPreferences.getInstance();
                  final List<Map<String, dynamic>> updatedTaskList =
                      _normalTaskList.map((task) => task.toJson()).toList();
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
                  _normalTaskList[index].isFinished
                      ? FinishedTaskName(
                          taskName: _normalTaskList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName: _normalTaskList[index].taskName,
                        ),
                  _normalTaskList[index].taskDescription.isNotEmpty
                      ? _normalTaskList[index].isFinished
                            ? FinishedTaskDescription(
                                taskDescription:
                                    _normalTaskList[index].taskDescription,
                              )
                            : UnfinishedTaskDescription(
                                taskDescription:
                                    _normalTaskList[index].taskDescription,
                              )
                      : const SizedBox(),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: _normalTaskList[index].isFinished
                    ? const Color(0xffA0A0A0)
                    : const Color(0xffC6C6C6),
              ), // three vertical dots
              onPressed: () {
                // handle menu action
              },
            ),
          ],
        ),
      ),
    );
  }
}
