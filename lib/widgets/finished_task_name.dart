import 'package:flutter/material.dart';

class FinishedTaskName extends StatelessWidget {
  const FinishedTaskName({required this.taskName, super.key});
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      taskName,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xffA0A0A0),
        decoration: TextDecoration.lineThrough,
        decorationColor: Color(0xffA0A0A0),
        decorationThickness: 1.5,
      ),
    );
  }
}
