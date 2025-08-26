import 'package:flutter/material.dart';

import '../widgets/body_login_view.dart';
import '../widgets/header_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(left: 14, right: 14, bottom: 18),
            child: Column(
              children: [
                HeaderLoginView(),
                SizedBox(height: 120),
                BodyLoginView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
