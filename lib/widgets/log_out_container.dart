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
    return ListTile(
      onTap: () {
        _logOut();
        Navigator.pushReplacementNamed(context, loginViewID);
      },
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        'assets/images/log_out_icon.svg',
        width: 32,
        height: 32,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      title: const Text(
        'Log Out',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: Color(0xffC6C6C6),
        size: 32,
      ),
    );
  }
}
