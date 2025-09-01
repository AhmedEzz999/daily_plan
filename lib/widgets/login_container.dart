import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'custom_snack_bar.dart';
import 'login_button.dart';
import 'login_form.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Full Name',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        const SizedBox(height: 8),
        LoginForm(formKey: _formKey, isTyping: isTyping),
        const SizedBox(height: 24),
        LoginButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              customSnackBar(context, 'Valid Username');
              Navigator.pushReplacementNamed(context, mainViewID);
            }
            setState(() {
              isTyping = true;
            });
          },
        ),
      ],
    );
  }
}
