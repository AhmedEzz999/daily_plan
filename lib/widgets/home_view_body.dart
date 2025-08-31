import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'high_priority_task_list.dart';
import 'normal_task_list.dart';
import 'task_progress_indicator.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 41,
          child: Text(
            textAlign: TextAlign.left,
            'Yuhuu ,Your work is',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 41,
          child: Row(
            children: [
              const Text(
                textAlign: TextAlign.left,
                'almost done ! ',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              SvgPicture.asset(
                'assets/images/waving_hand.svg',
                width: 41,
                height: 41,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const TaskProgressIndicator(),
        const SizedBox(height: 12),
        HighPriorityTaskList(
          taskList: taskList.where((task) => task.isHighPriority).toList(),
        ),
        const SizedBox(height: 24),
        const Text(
          'My Tasks',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 18),
        NormalTaskList(
          taskList: taskList.where((task) => !task.isHighPriority).toList(),
        ),
      ],
    );
  }
}
