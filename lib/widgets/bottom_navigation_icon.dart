import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationIcon extends StatefulWidget {
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
  State<BottomNavigationIcon> createState() => _BottomNavigationIconState();
}

class _BottomNavigationIconState extends State<BottomNavigationIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: widget.iconIndex == widget.currentIndex
          ? SvgPicture.asset(widget.selectedIcon, width: 30, height: 30)
          : SvgPicture.asset(widget.unSelectedIcon, width: 26, height: 26),
    );
  }
}
