import 'package:flutter/material.dart';

class TaskPrioritySwitch extends StatelessWidget {
  const TaskPrioritySwitch({
    required this.isHighPriority,
    required this.onChanged,
    super.key,
  });

  final bool isHighPriority;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(value: isHighPriority, onChanged: onChanged);
  }
}
