import 'package:flutter/material.dart';

class TaskNameField extends StatelessWidget {
  const TaskNameField({required this.taskNameController, super.key});
  final TextEditingController taskNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      controller: taskNameController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF282828),
        hintText: 'Finish UI design for login screen',
        hintStyle: const TextStyle(fontSize: 18, color: Color(0xff6D6D6D)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        errorStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
