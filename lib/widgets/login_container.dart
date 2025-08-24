import 'package:flutter/material.dart';

import 'login_button.dart';
import 'login_form.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Full Name',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        SizedBox(height: 8),
        LoginForm(),
        SizedBox(height: 24),
        LoginButton(),
      ],
    );
  }
}
