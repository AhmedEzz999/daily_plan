import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';
import 'high_priority_tasks_list.dart';
import 'normal_tasks_list.dart';
import 'progress_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<TaskModel> _highPriorityTasksList = [];
  List<TaskModel> _normalTasksList = [];

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
    _loadHighPriorityTasks();
    _loadNormalTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProgressSection(
          allTasksList: [..._highPriorityTasksList, ..._normalTasksList],
        ),
        const SizedBox(height: 12),
        HighPriorityTasksList(highPriorityTasksList: _highPriorityTasksList),
        const SizedBox(height: 24),
        const Text(
          'My Tasks',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 18),
        NormalTasksList(normalTasksList: _normalTasksList),
      ],
    );
  }
}
