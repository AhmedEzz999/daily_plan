import 'package:flutter/material.dart';

import '../widgets/to_do_tasks_list.dart';

class ToDoTasksView extends StatelessWidget {
  const ToDoTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To Do Tasks',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 32),
          ToDoTasksList(),
        ],
      ),
    );
  }
}
