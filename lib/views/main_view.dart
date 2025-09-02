import 'package:flutter/material.dart';

import '../widgets/task_navigation_bar.dart';
import 'completed_tasks_view.dart';
import 'home_view.dart';
import 'profile_view.dart';
import 'to_do_tasks_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeView(),
    const ToDoTasksView(),
    const CompletedTasksView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TaskNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(child: _screens[_selectedIndex]),
    );
  }
}
