import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.formKey, required this.isTyping, super.key});
  final GlobalKey<FormState> formKey;
  final bool isTyping;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController formController;

  @override
  void initState() {
    super.initState();
    formController = TextEditingController();
  }

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  bool isValidUsername(String username) {
    final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_ ]{2,19}$');
    return regex.hasMatch(username);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: widget.isTyping
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      key: widget.formKey,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a username';
          }
          if (!isValidUsername(value)) {
            return 'Invalid Username';
          }
          return null;
        },
        controller: formController,
        onSaved: (username) async {
          _saveUsername(username!);
        },
        style: const TextStyle(color: Colors.white, fontSize: 24),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF282828),
          hintText: 'e.g. Sarah Khalid',
          hintStyle: const TextStyle(fontSize: 24, color: Color(0xff6D6D6D)),
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
