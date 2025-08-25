import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1300),
      content: Text(message, style: const TextStyle(fontSize: 22)),
    ),
  );
}
