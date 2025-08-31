import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SaveUserDetailsButton extends StatelessWidget {
  const SaveUserDetailsButton({required this.onPressed, super.key});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
      child: const Text(
        'Save Changes',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
