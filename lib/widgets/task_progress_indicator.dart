import 'package:flutter/material.dart';

class TaskProgressIndicator extends StatelessWidget {
  const TaskProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
