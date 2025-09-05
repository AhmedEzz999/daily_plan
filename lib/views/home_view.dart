import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/preferences_manager.dart';
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
  List<TaskModel> _allTasksList = [];

  void _loadAllTasks() async {
    final String? tasksString = PreferencesManager().getAllTasks();
    if (tasksString == null) return;
    final List<dynamic> taskListDecode = jsonDecode(tasksString);
    setState(() {
      _allTasksList = taskListDecode
          .map((element) => TaskModel.fromJson(element))
          .toList()
          .reversed
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAllTasks();
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
              allTasksList: _allTasksList,
            ),
            TasksList(allTasksList: _allTasksList),
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
