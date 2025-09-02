import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/user_model.dart';
import '../views/edit_user_details_view.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditUserDetailsView(userModel: userModel);
                },
              ),
            );
          },
          contentPadding: const EdgeInsets.all(0),
          leading: SvgPicture.asset(
            'assets/images/bottom_navigation_icons/profile_icon.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          title: const Text(
            'User Details',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Color(0xffC6C6C6),
            size: 32,
          ),
        ),
        const Divider(color: Color(0xff6E6E6E), thickness: 1),
      ],
    );
  }
}
