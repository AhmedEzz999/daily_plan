import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({required this.onPressed, super.key});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add, size: 26),
      label: const Text(
        'Add Task',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
    );
  }
}
