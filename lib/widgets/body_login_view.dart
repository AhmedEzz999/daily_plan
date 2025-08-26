import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_container.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              const Text(
                'Welcome To Daily Plan',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              const SizedBox(width: 6),
              SvgPicture.asset(
                'assets/images/waving_hand.svg',
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const FittedBox(
          child: Text(
            'Your productivity journey starts here.',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        const SizedBox(height: 24),
        FittedBox(
          child: SvgPicture.asset(
            'assets/images/work_in_progress.svg',
            width: 206,
            height: 216,
          ),
        ),
        const SizedBox(height: 28),
        const LoginContainer(),
      ],
    );
  }
}
