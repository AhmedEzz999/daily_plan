import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'task_check_box.dart';

class NormalPriorityTaskList extends StatefulWidget {
  const NormalPriorityTaskList({super.key});

  @override
  State<NormalPriorityTaskList> createState() => _NormalPriorityTaskListState();
}

class _NormalPriorityTaskListState extends State<NormalPriorityTaskList> {
  List<TaskModel> taskList = [];
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      taskList = taskListDecode
          .map((element) => TaskModel.fromJson(element))
          .toList();
    });
    log('$taskList');
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: taskList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xff282828),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            const TaskCheckBox(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    taskList[index].taskName,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  taskList[index].taskDescription.isNotEmpty
                      ? Text(
                          maxLines: 1,
                          taskList[index].taskDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xffC6C6C6),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xffC6C6C6),
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
