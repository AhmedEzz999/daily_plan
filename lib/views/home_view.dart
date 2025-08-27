import 'package:flutter/material.dart';

import '../widgets/add_task_button.dart';
import '../widgets/header_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderHomeView(),
              Align(alignment: Alignment.centerRight, child: AddTaskButton()),
            ],
          ),
        ),
      ),
    );
  }
}
