import 'package:flutter/material.dart';

import '../constants/constants.dart';

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
    return Switch(
      value: isHighPriority,
      onChanged: onChanged,
      activeTrackColor: primaryColor,
      activeThumbColor: Colors.white,
    );
  }
}
