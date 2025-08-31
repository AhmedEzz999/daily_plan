import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TaskProgressIndicator extends StatelessWidget {
  const TaskProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                'Achieved Tasks',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Text(
                textAlign: TextAlign.left,
                '3 Out of 6 Done',
                style: TextStyle(fontSize: 18, color: Color(0xffC6C6C6)),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Transform.rotate(
                angle: (3 * 3.14) / 2,
                child: const CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 6,
                  strokeAlign: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  backgroundColor: Color(0xff6D6D6D),
                ),
              ),
              const Text(
                '50%',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
