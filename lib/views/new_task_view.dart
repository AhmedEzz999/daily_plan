import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
import '../widgets/custom_snack_bar.dart';
import '../widgets/new_task_body.dart';
import '../widgets/save_task_button.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<dynamic> tasksList = [];
  late TextEditingController _taskNameController;
  late TextEditingController _taskDescriptionController;
  bool _isHighPriority = false;

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController();
    _taskDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  void _addTask() async {
    final Map<String, dynamic> task = {
      'Task Name': _taskNameController.text,
      'Task Description': _taskDescriptionController.text,
      'High Priority': _isHighPriority,
    };
    final String? tasksListEncode = PreferencesManager().getAllTasks();
    if (tasksListEncode != null) {
      tasksList = jsonDecode(tasksListEncode);
    }
    tasksList.add(task);
    await PreferencesManager().setAllTasks(jsonEncode(tasksList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Task')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            children: [
              NewTaskBody(
                formKey: _formKey,
                taskNameController: _taskNameController,
                taskDescriptionController: _taskDescriptionController,
                isHighPriority: _isHighPriority,
                onChanged: (newValue) {
                  setState(() {
                    _isHighPriority = newValue;
                  });
                },
              ),
              SaveTaskButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _addTask();
                    customSnackBar(context, 'Task Created Successfully');
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
