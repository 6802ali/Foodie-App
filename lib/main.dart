import 'package:flutter/material.dart';
import 'Screens/onboarding/Nearby.dart';
import 'Screens/onboarding/Select.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create a PageController to pass to Nearby widget
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Nearby(controller: _pageController),
      ),
    );
  }
}
