import 'package:flutter/material.dart';

import '../widgets/completed_tasks_list.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completed Tasks',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 32),
          Expanded(child: CompletedTasksList()),
        ],
      ),
    );
  }
}
