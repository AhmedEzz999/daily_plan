import 'package:flutter/material.dart';

import '../widgets/to_do_tasks_list.dart';

class ToDoTasksView extends StatelessWidget {
  const ToDoTasksView({super.key});

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
                'To Do Tasks',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              ToDoTasksList(),
            ],
          ),
        ),
      ),
    );
  }
}
