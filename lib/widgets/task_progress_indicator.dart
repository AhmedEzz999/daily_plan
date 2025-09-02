import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/task_model.dart';

class TaskProgressIndicator extends StatelessWidget {
  const TaskProgressIndicator({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  Widget build(BuildContext context) {
    final int allTasksDoneNumber = allTasksList
        .where((task) => task.isFinished)
        .length;
    final int allTasksNumber = allTasksList.length;
    final double progress = allTasksNumber == 0
        ? 0
        : allTasksDoneNumber / allTasksNumber;

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textAlign: TextAlign.left,
                'Achieved Tasks',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Text(
                textAlign: TextAlign.left,
                '$allTasksDoneNumber Out of $allTasksNumber Done',
                style: const TextStyle(fontSize: 18, color: Color(0xffC6C6C6)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Transform.rotate(
                  angle: (3 * pi) / 2,
                  child: SizedBox(
                    height: 42,
                    width: 42,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 6,
                      strokeAlign: 2.5,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        primaryColor,
                      ),
                      backgroundColor: const Color(0xff6D6D6D),
                    ),
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
