import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/task_model.dart';
import '../widgets/header_home_view.dart';
import '../widgets/home_view_body.dart';
import '../widgets/tasks_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          .toList()
          .reversed
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
          .toList()
          .reversed
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              pinned: true,
              toolbarHeight: 86,
              flexibleSpace: FlexibleSpaceBar(background: HeaderHomeView()),
            ),
            HomeViewBody(
              highPriorityTasksList: _highPriorityTasksList,
              normalTasksList: _normalTasksList,
            ),
            TasksList(
              allTasksList: [..._highPriorityTasksList, ..._normalTasksList],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.only(left: 16, right: 22),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.pushNamed(context, newTaskViewID);
        },
        icon: const Icon(Icons.add, size: 24),
        label: const Text(
          'Add New Task',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
