import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/header_home_view.dart';
import '../widgets/home_view_body.dart';
import '../widgets/task_navigation_bar.dart';
import 'completed_view.dart';
import 'profile_view.dart';
import 'to_do_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeView(),
    const ToDoView(),
    const CompletedView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 82,
                flexibleSpace: FlexibleSpaceBar(background: HeaderHomeView()),
              ),
              SliverToBoxAdapter(child: HomeViewBody()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.only(left: 20, right: 24),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.pushNamed(context, newTaskViewID);
        },
        icon: const Icon(Icons.add, size: 26),
        label: const Text(
          'Add New Task',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      bottomNavigationBar: TaskNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
