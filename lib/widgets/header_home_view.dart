import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class HeaderHomeView extends StatefulWidget {
  const HeaderHomeView({super.key});

  @override
  State<HeaderHomeView> createState() => _HeaderHomeViewState();
}

class _HeaderHomeViewState extends State<HeaderHomeView> {
  UserModel? userModel;

  Future<void> _getUserModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userModelString = prefs.getString('user name');
    if (userModelString == null) return;
    final Map<String, dynamic> userModelDecode = jsonDecode(userModelString);
    userModel = UserModel.fromJson(userModelDecode);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          userModel?.imageSource ?? 'assets/images/profile_picture.png',
          width: 54,
          height: 54,
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Good Evening, ${userModel?.userName ?? 'Loading...'}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text(
                userModel?.motivationQuote ??
                    'One task at a time. One step closer.',
                style: const TextStyle(color: Color(0xffC6C6C6), fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: Color(0xff282828),
            radius: 28,
            child: Icon(Icons.wb_sunny_outlined, size: 36, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
