import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'finished_task_description.dart';
import 'finished_task_name.dart';
import 'task_check_box.dart';
import 'unfinished_task_description.dart';
import 'unfinished_task_name.dart';

class NormalTaskList extends StatefulWidget {
  const NormalTaskList({required this.taskList, super.key});
  final List<TaskModel> taskList;

  @override
  State<NormalTaskList> createState() => _NormalTaskListState();
}

class _NormalTaskListState extends State<NormalTaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xff282828),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskCheckBox(
                isFinished: widget.taskList[index].isFinished,
                onChanged: (value) {
                  setState(() {
                    widget.taskList[index].isFinished = value!;
                  });
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.taskList[index].isFinished
                      ? FinishedTaskName(
                          taskName: widget.taskList[index].taskName,
                        )
                      : UnfinishedTaskName(
                          taskName: widget.taskList[index].taskName,
                        ),
                  widget.taskList[index].taskDescription.isNotEmpty
                      ? widget.taskList[index].isFinished
                            ? FinishedTaskDescription(
                                taskDescription:
                                    widget.taskList[index].taskDescription,
                              )
                            : UnfinishedTaskDescription(
                                taskDescription:
                                    widget.taskList[index].taskDescription,
                              )
                      : const SizedBox(),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xffC6C6C6),
              ), // three vertical dots
              onPressed: () {
                // handle menu action
              },
            ),
          ],
        ),
      ),
    );
  }
}
