import 'package:flutter/material.dart';
import 'Screens/onboarding/Nearby.dart';
import 'Screens/onboarding/Select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Nearby()
    );
  }
}

