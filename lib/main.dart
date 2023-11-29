import 'package:flutter/material.dart';
import 'Screens/onboarding/Nearby.dart';
import 'Screens/onboarding/Select.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a PageController to pass to Nearby widget
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nearby(controller: _pageController), // Provide the controller here
    );
  }
}
