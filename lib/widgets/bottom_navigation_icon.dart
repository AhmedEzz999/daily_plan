import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    required this.iconIndex,
    required this.currentIndex,
    required this.iconSource,
    super.key,
  });
  final int iconIndex;
  final int currentIndex;
  final String iconSource;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SvgPicture.asset(
        iconSource,
        width: iconIndex == currentIndex ? 30 : 26,
        height: iconIndex == currentIndex ? 30 : 26,
        colorFilter: ColorFilter.mode(
          iconIndex == currentIndex ? primaryColor : Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
