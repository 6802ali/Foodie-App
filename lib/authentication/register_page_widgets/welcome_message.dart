import 'package:flutter/material.dart';

class WelcomMessage extends StatelessWidget {
  const WelcomMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/Order.png',
          width: 200,
          height: 200,
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          'Before enjoying Food Media services, please register first.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
