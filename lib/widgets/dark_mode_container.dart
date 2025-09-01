import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/user_model.dart';
import 'dark_mode_switch.dart';

class DarkModeContainer extends StatefulWidget {
  const DarkModeContainer({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  State<DarkModeContainer> createState() => _DarkModeContainerState();
}

class _DarkModeContainerState extends State<DarkModeContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/moon_icon.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Dark Mode',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          DarkModeSwitch(
            value: widget.userModel?.darkMode ?? true,
            onChanged: (newMode) {
              setState(() {
                widget.userModel?.darkMode = newMode;
              });
            },
          ),
        ],
      ),
    );
  }
}
