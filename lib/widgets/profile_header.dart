import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  userModel?.imageSource ?? 'assets/images/profile_picture.png',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: const Color(0xff282828),
                radius: 22,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
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
