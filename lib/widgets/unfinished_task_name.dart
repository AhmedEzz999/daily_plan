import 'package:flutter/material.dart';

class UnfinishedTaskName extends StatelessWidget {
  const UnfinishedTaskName({required this.taskName, super.key});
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      taskName,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
