import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../widgets/save_user_details_button.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      'Motivation Quote',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SaveUserDetailsButton(onPressed: () async {}),
            ],
          ),
        ),
      ),
    );
  }
}
