import 'package:flutter/material.dart';

class TaskDescriptionField extends StatelessWidget {
  const TaskDescriptionField({
    required this.taskDescriptionController,
    super.key,
  });
  final TextEditingController taskDescriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 6,
      maxLines: 8,
      controller: taskDescriptionController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF282828),
        hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
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
