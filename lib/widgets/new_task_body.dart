import 'package:flutter/material.dart';

import 'task_description_field.dart';
import 'task_name_field.dart';
import 'task_priority_switch.dart';

class NewTaskBody extends StatelessWidget {
  const NewTaskBody({
    required this.formKey,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.isHighPriority,
    required this.onChanged,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;
  final bool isHighPriority;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Task Name',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 8),
              TaskNameField(taskNameController: taskNameController),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Task Description',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 8),
              TaskDescriptionField(
                taskDescriptionController: taskDescriptionController,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'High Priority',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  TaskPrioritySwitch(
                    isHighPriority: isHighPriority,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
