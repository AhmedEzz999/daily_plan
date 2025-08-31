import 'package:flutter/material.dart';

class UnfinishedTaskDescription extends StatelessWidget {
  const UnfinishedTaskDescription({
    required this.taskDescription,
    super.key,
  });
  final String taskDescription;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      taskDescription,
      style: const TextStyle(fontSize: 16, color: Color(0xffC6C6C6)),
    );
  }
}
