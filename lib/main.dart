import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Plan',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      routes: {
        loginViewID: (context) => const LoginView(),
        homeViewID: (context) => const HomeView(),
      },
      home: const LoginView(),
    );
  }
}
