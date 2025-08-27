import 'package:flutter/material.dart';

class TaskDescriptionForm extends StatelessWidget {
  const TaskDescriptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        minLines: 6,
        maxLines: 8,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a username';
          }
          return null;
        },
        onSaved: (taskName) {},
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
      ),
    );
  }
}
