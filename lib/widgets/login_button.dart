import 'package:flutter/material.dart';

import '../constants/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
      child: const Text(
        'Let’s Get Started',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
