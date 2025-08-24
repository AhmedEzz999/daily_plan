import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/body_login_view.dart';
import '../widgets/header_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF181818),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(left: 14, right: 14, bottom: 18),
            child: Column(
              children: [
                SizedBox(height: 60),
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
