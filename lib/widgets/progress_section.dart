import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/task_model.dart';
import 'task_progress_indicator.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({required this.allTasksList, super.key});
  final List<TaskModel> allTasksList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 41,
          child: Text(
            textAlign: TextAlign.left,
            'Yuhuu ,Your work is',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 41,
          child: Row(
            children: [
              const Text(
                textAlign: TextAlign.left,
                'almost done ! ',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              SvgPicture.asset(
                'assets/images/waving_hand.svg',
                width: 41,
                height: 41,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TaskProgressIndicator(allTasksList: allTasksList),
      ],
    );
  }
}
