import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/header_home_view.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [HeaderHomeView(), HomeViewBody()]),
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
    );
  }
}
