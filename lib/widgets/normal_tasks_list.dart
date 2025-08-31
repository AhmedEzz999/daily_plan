import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class NormalTasksList extends StatefulWidget {
  const NormalTasksList({super.key});

  @override
  State<NormalTasksList> createState() => _NormalTasksListState();
}

class _NormalTasksListState extends State<NormalTasksList> {
  List<TaskModel> _normalTasksList = [];

  void _loadNormalTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('normal tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      _normalTasksList = taskListDecode
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
      itemCount: _normalTasksList.length,
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
                isFinished: _normalTasksList[index].isFinished,
                onChanged: (value) async {
                  setState(() {
                    _normalTasksList[index].isFinished = value!;
                  });
                  final prefs = await SharedPreferences.getInstance();
                  final List<Map<String, dynamic>> updatedTaskList =
                      _normalTasksList.map((task) => task.toJson()).toList();
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
                  _normalTasksList[index].isFinished
                      ? FinishedTaskName(
                          taskName: _normalTasksList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName: _normalTasksList[index].taskName,
                        ),
                  _normalTasksList[index].taskDescription.isNotEmpty
                      ? _normalTasksList[index].isFinished
                            ? FinishedTaskDescription(
                                taskDescription:
                                    _normalTasksList[index].taskDescription,
                              )
                            : UnfinishedTaskDescription(
                                taskDescription:
                                    _normalTasksList[index].taskDescription,
                              )
                      : const SizedBox(),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: _normalTasksList[index].isFinished
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
