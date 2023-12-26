import 'package:flutter/material.dart';
import 'package:flutter_application_1/Searchwidget/search.dart';
import 'package:flutter_application_1/homewidget/Topbar.dart';
import 'package:flutter_application_1/homewidget/advertisement.dart';
import 'package:flutter_application_1/homewidget/suggestedrestaurants.dart';
import 'Screens/onboarding/Nearby.dart';
import 'Screens/onboarding/Select.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Restaurantswidget/restaurantpage.dart';
import 'allrestuarant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        body: Home(), //Nearby(controller: _pageController),
      ),
    );
  }
}
