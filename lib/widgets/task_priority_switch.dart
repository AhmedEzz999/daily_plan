import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TaskPrioritySwitch extends StatefulWidget {
  const TaskPrioritySwitch({super.key});

  @override
  State<TaskPrioritySwitch> createState() => _TaskPrioritySwitchState();
}

class _TaskPrioritySwitchState extends State<TaskPrioritySwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: kPrimaryColor,
      activeThumbColor: Colors.white,
    );
  }
}
