import 'package:flutter/material.dart';

import '../widgets/to_do_tasks_list.dart';

class ToDoTasksView extends StatelessWidget {
  const ToDoTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.only(left: 24, right: 16),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'To Do Tasks',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(16), child: ToDoTasksList()),
        ],
      ),
    );
  }
}
