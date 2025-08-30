import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HighPriorityTaskList extends StatelessWidget {
  const HighPriorityTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'High Priority Tasks',
            style: TextStyle(fontSize: 20, color: primaryColor),
          ),
          SizedBox(height: 8),
          Row(),
        ],
      ),
    );
  }
}
