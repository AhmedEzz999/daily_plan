import 'dart:convert';

import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'models/preferences_manager.dart';
import 'models/user_model.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/main_view.dart';
import 'views/new_task_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  UserModel? _getUserModel() {
    UserModel? userModel;
    final String? userModelString = PreferencesManager().getUsername();
    if (userModelString == null) return userModel;
    final Map<String, dynamic> userModelDecode = jsonDecode(userModelString);
    userModel = UserModel.fromJson(userModelDecode);
    return userModel;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Plan',
      theme: ThemeData(
        useMaterial3: true,
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          backgroundColor: scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: Colors.white, size: 32),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return const Color(0xff9E9E9E);
          }),
          trackColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return primaryColor;
            }
            return Colors.white;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return const Color(0xff9E9E9E);
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),
        ),
      ),
      routes: {
        loginViewID: (context) => const LoginView(),
        mainViewID: (context) => const MainView(),
        homeViewID: (context) => const HomeView(),
        newTaskViewID: (context) => const NewTaskView(),
      },
      home: _getUserModel() == null ? const LoginView() : const MainView(),
    );
  }
}
