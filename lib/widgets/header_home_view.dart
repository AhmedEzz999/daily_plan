import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/logo.svg', width: 42, height: 42),
        const SizedBox(width: 16),
        const Text(
          'Daily Plan',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ],
    );
  }
}
