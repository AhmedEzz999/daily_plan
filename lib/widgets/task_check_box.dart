import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TaskCheckBox extends StatefulWidget {
  const TaskCheckBox({
    required this.isFinished,
    required this.onChanged,
    super.key,
  });
  final bool isFinished;
  final void Function(bool?)? onChanged;

  @override
  State<TaskCheckBox> createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        activeColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: widget.isFinished,
        onChanged: widget.onChanged,
      ),
    );
  }
}
