import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({required this.userNameController, super.key});
  final TextEditingController userNameController;

  bool isValidUsername(String userName) {
    final regex = RegExp(r'^[a-zA-Z ][a-zA-Z0-9_ ]{2,19}$');
    return regex.hasMatch(userName);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your name';
        }
        if (!isValidUsername(value)) {
          return 'Invalid Name';
        }
        return null;
      },
      controller: userNameController,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF282828),
        hintText: 'Usama Elgendy',
        hintStyle: const TextStyle(fontSize: 18, color: Color(0xff6D6D6D)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff6E6E6E)),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff6E6E6E)),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff6E6E6E)),
          borderRadius: BorderRadius.circular(16),
        ),
        errorStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
