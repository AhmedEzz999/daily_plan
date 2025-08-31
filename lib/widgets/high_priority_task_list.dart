import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../models/task_model.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_name.dart';

class HighPriorityTaskList extends StatefulWidget {
  const HighPriorityTaskList({required this.taskList, super.key});
  final List<TaskModel> taskList;

  @override
  State<HighPriorityTaskList> createState() => _HighPriorityTaskListState();
}

class _HighPriorityTaskListState extends State<HighPriorityTaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'High Priority Tasks',
              style: TextStyle(fontSize: 20, color: primaryColor),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.taskList.length,
                  itemBuilder: (context, index) => Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xff282828),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        TaskCheckBox(
                          isFinished: widget.taskList[index].isFinished,
                          onChanged: (value) {
                            setState(() {
                              widget.taskList[index].isFinished = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: widget.taskList[index].isFinished
                              ? FinishedTaskName(
                                  taskName: widget.taskList[index].taskName,
                                )
                              : UnfinishedTaskName(
                                  taskName: widget.taskList[index].taskName,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: const Color(0xff6E6E6E), width: 2),
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SvgPicture.asset(
                      'assets/images/arrow-up-right.svg',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
