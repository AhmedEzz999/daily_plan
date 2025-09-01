import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: primaryColor,
      activeThumbColor: Colors.white,
      value: value,
      onChanged: onChanged,
    );
  }
}
