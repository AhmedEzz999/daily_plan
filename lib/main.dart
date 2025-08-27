import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constants.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/new_task_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? username;

  Future<void> _usernameExist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameExist();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Plan',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kScaffoldBackgroundColor,
          iconTheme: IconThemeData(color: Colors.white, size: 32),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      routes: {
        loginViewID: (context) => const LoginView(),
        homeViewID: (context) => const HomeView(),
        newTaskViewID: (context) => const NewTaskView(),
      },
      home: username == null ? const LoginView() : const HomeView(),
    );
  }
}
