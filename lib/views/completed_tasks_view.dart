import 'package:flutter/material.dart';

import '../widgets/completed_tasks_list.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Completed Tasks',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              CompletedTasksList(),
            ],
          ),
        ),
      ),
    );
  }
}
