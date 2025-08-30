import 'package:flutter/material.dart';

class TaskCheckBox extends StatefulWidget {
  const TaskCheckBox({super.key});

  @override
  State<TaskCheckBox> createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.scale(
        scale: 1.3,
        child: Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
