import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_section.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Profile',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          ProfileHeader(userModel: userModel),
          const SizedBox(height: 24),
          ProfileInfoSection(userModel: userModel),
        ],
      ),
    );
  }
}
