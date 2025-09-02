import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'dark_mode_container.dart';
import 'log_out_container.dart';
import 'user_details_container.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile Info',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 4),
        UserDetailsContainer(userModel: userModel),
        DarkModeContainer(userModel: userModel),
        const LogOutContainer(),
      ],
    );
  }
}
