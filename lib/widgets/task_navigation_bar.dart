import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'bottom_navigation_icon.dart';

class TaskNavigationBar extends StatelessWidget {
  const TaskNavigationBar({required this.selectedIndex, super.key, this.onTap});
  final int selectedIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: scaffoldBackgroundColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: const Color(0xffC6C6C6),
      elevation: 0,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: BottomNavigationIcon(
            iconIndex: 0,
            currentIndex: selectedIndex,
            selectedIcon:
                'assets/images/bottom_navigation_icons/selected_home_icon.svg',
            unSelectedIcon:
                'assets/images/bottom_navigation_icons/unselected_home_icon.svg',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: BottomNavigationIcon(
            iconIndex: 1,
            currentIndex: selectedIndex,
            selectedIcon:
                'assets/images/bottom_navigation_icons/selected_to_do_icon.svg',
            unSelectedIcon:
                'assets/images/bottom_navigation_icons/unselected_to_do_icon.svg',
          ),
          label: 'To Do',
        ),
        BottomNavigationBarItem(
          icon: BottomNavigationIcon(
            iconIndex: 2,
            currentIndex: selectedIndex,
            selectedIcon:
                'assets/images/bottom_navigation_icons/selected_completed_icon.svg',
            unSelectedIcon:
                'assets/images/bottom_navigation_icons/unselected_completed_icon.svg',
          ),
          label: 'Completed',
        ),
        BottomNavigationBarItem(
          icon: BottomNavigationIcon(
            iconIndex: 3,
            currentIndex: selectedIndex,
            selectedIcon:
                'assets/images/bottom_navigation_icons/selected_profile_icon.svg',
            unSelectedIcon:
                'assets/images/bottom_navigation_icons/unselected_profile_icon.svg',
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
