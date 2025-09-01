import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            userModel?.imageSource ?? 'assets/images/profile_picture.png',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          userModel?.userName ?? 'Loading...',
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          userModel?.motivationQuote ?? 'One task at a time. One step closer.',
          style: const TextStyle(fontSize: 18, color: Color(0xffC6C6C6)),
        ),
      ],
    );
  }
}
