import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/preferences_manager.dart';
import '../models/user_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({required this.formKey, required this.isTyping, super.key});
  final GlobalKey<FormState> formKey;
  final bool isTyping;

  Future<void> _saveUserName(String userName) async {
    UserModel? userModel;
    final Map<String, dynamic> userNameJson = {
      'user name': userName,
      'image source': null,
      'motivation quote': null,
      'dark mode': null,
    };
    userModel = UserModel.fromJson(userNameJson);
    final String userNameEncode = jsonEncode(userModel);
    await PreferencesManager().setUsername(userNameEncode);
  }

  bool isValidUsername(String userName) {
    final regex = RegExp(r'^[a-zA-Z ][a-zA-Z0-9_ ]{2,19}$');
    return regex.hasMatch(userName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: isTyping
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      key: formKey,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter your name';
          }
          if (!isValidUsername(value)) {
            return 'Invalid Name';
          }
          return null;
        },
        onSaved: (userName) async {
          _saveUserName(userName!.trim());
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
