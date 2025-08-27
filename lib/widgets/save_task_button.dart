import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, size: 26),
      label: const Text(
        'Add Task',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
    );
  }
}
