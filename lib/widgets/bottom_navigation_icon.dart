import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    required this.iconIndex,
    required this.currentIndex,
    required this.selectedIcon,
    required this.unSelectedIcon,
    super.key,
  });
  final int iconIndex;
  final int currentIndex;
  final String selectedIcon;
  final String unSelectedIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: iconIndex == currentIndex
          ? SvgPicture.asset(selectedIcon, width: 30, height: 30)
          : SvgPicture.asset(unSelectedIcon, width: 26, height: 26),
    );
  }
}
