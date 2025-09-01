import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            padding: const EdgeInsets.only(left: 12, right: 12),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 4),
        const Text(
          'My Profile',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ],
    );
  }
}
