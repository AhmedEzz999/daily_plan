import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderHomeView extends StatefulWidget {
  const HeaderHomeView({super.key});

  @override
  State<HeaderHomeView> createState() => _HeaderHomeViewState();
}

class _HeaderHomeViewState extends State<HeaderHomeView> {
  String? username;

  Future<void> _getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/profile_picture.png', width: 54, height: 54),
        const SizedBox(width: 8),
        SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Good Evening, ${username ?? 'Loading...'}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const Text(
                'One task at a time. One step closer.',
                style: TextStyle(color: Color(0xffC6C6C6), fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          backgroundColor: Color(0xff282828),
          radius: 28,
          child: Icon(Icons.wb_sunny_outlined, size: 36, color: Colors.white),
        ),
      ],
    );
  }
}
