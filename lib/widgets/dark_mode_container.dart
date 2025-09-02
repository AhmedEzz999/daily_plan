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
  void _toggleDarkMode(bool newMode) {
    setState(() {
      widget.userModel?.darkMode = newMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.userModel?.darkMode ?? true;
    return Column(
      children: [
        ListTile(
          onTap: () => _toggleDarkMode(!isDark),
          contentPadding: const EdgeInsets.all(0),
          leading: SvgPicture.asset(
            'assets/images/moon_icon.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          title: const Text(
            'Dark Mode',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          trailing: DarkModeSwitch(
            value: widget.userModel?.darkMode ?? true,
            onChanged: _toggleDarkMode,
          ),
        ),
        const Divider(color: Color(0xff6E6E6E), thickness: 1),
      ],
    );
  }
}
