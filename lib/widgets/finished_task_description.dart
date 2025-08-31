import 'package:flutter/material.dart';

class FinishedTaskDescription extends StatelessWidget {
  const FinishedTaskDescription({required this.taskDescription, super.key});
  final String taskDescription;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      taskDescription,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xffA0A0A0),
        decoration: TextDecoration.lineThrough,
        decorationColor: Color(0xffA0A0A0),
        decorationThickness: 1.5,
      ),
    );
  }
}
