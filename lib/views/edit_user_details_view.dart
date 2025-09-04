import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/preferences_manager.dart';
import '../models/user_model.dart';
import '../widgets/custom_snack_bar.dart';
import '../widgets/motivation_quote_field.dart';
import '../widgets/save_user_details_button.dart';
import '../widgets/user_name_field.dart';

class EditUserDetailsView extends StatefulWidget {
  const EditUserDetailsView({required this.userModel, super.key});
  final UserModel? userModel;

  @override
  State<EditUserDetailsView> createState() => _EditUserDetailsViewState();
}

class _EditUserDetailsViewState extends State<EditUserDetailsView> {
  final GlobalKey<FormState> _editUserKey = GlobalKey();
  late TextEditingController _userNameController;
  late TextEditingController _motivationQuoteController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(
      text: widget.userModel?.userName ?? 'Loading...',
    );
    _motivationQuoteController = TextEditingController(
      text:
          widget.userModel?.motivationQuote ??
          'One task at a time. One step closer.',
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _motivationQuoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Details',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Form(
            key: _editUserKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Name',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      UserNameField(userNameController: _userNameController),
                      const SizedBox(height: 24),
                      const Text(
                        'Motivation Quote',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      MotivationQuoteField(
                        motivationQuoteController: _motivationQuoteController,
                      ),
                    ],
                  ),
                ),
                SaveUserDetailsButton(
                  onPressed: () async {
                    if (_editUserKey.currentState!.validate()) {
                      final Map<String, dynamic> updatedUser = {
                        'user name': _userNameController.text,
                        'image source': widget.userModel!.imageSource,
                        'motivation quote': _motivationQuoteController.text,
                        'dark mode': widget.userModel!.darkMode,
                      };
                      final UserModel userModel = UserModel.fromJson(
                        updatedUser,
                      );
                      await PreferencesManager().setUsername(jsonEncode(userModel));
                      customSnackBar(context, 'User is updated successfully');
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
