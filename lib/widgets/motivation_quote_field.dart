import 'package:flutter/material.dart';

class MotivationQuoteField extends StatelessWidget {
  const MotivationQuoteField({
    required this.motivationQuoteController,
    super.key,
  });
  final TextEditingController motivationQuoteController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 6,
      maxLines: 8,
      controller: motivationQuoteController,
      style: const TextStyle(color: Color(0xffC6C6C6), fontSize: 20),
      cursorColor: const Color(0xffC6C6C6),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF282828),
        hintText: 'One task at a time. One step closer.',
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
