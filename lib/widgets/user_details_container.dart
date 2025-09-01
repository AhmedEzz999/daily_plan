import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/user_model.dart';
import '../views/edit_user_details_view.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bottom_navigation_icons/profile_icon.svg',
                width: 32,
                height: 32,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'User Details',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditUserDetailsView(userModel: userModel);
                      },
                    ),
                  );
                },
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xffC6C6C6),
                  size: 32,
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xff6E6E6E), endIndent: 15),
        ],
      ),
    );
  }
}
