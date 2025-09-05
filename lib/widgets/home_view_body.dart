import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'high_priority_tasks_list.dart';
import 'progress_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ProgressSection(allTasksList: allTasksList),
        const SizedBox(height: 16),
        HighPriorityTasksList(allTasksList: allTasksList),
        const SizedBox(height: 14),
        const Text(
          'My Tasks',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 12),
      ]),
    );
  }
}
