import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/save_task_button.dart';
import '../widgets/task_description_form.dart';
import '../widgets/task_name_form.dart';
import '../widgets/task_priority_switch.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        title: const Text('New Task'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Task Name',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 12),
            TaskNameForm(),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Task Description',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 12),
            TaskDescriptionForm(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'High Priority',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                TaskPrioritySwitch()
              ],
            ),
            SizedBox(height: 120),
            SaveTaskButton(),
          ],
        ),
      ),
    );
  }
}
