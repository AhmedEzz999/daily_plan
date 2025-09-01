import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class LogOutContainer extends StatelessWidget {
  const LogOutContainer({super.key});

  Future<void> _logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user name');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/log_out_icon.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Log Out',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              _logOut();
              Navigator.pushReplacementNamed(context, loginViewID);
            },
            style: IconButton.styleFrom(
              padding: const EdgeInsets.only(left: 12, right: 12),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
