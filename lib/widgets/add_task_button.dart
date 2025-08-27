import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, newTaskViewID);
      },
      icon: const Icon(Icons.add, size: 26),
      label: const Text(
        'Add New Task',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        fixedSize: const Size(170, 46),
      ),
    );
  }
}
