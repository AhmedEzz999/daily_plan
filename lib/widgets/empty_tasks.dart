import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({required this.firstMessage, this.secondMessage, super.key});
  final String firstMessage;
  final String? secondMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xff282828),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              firstMessage,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
          secondMessage != null
              ? FittedBox(
                  child: Text(
                    secondMessage!,
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
