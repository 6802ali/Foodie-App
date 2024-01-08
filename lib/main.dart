// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Orderspage/orderdetails.dart';
import 'package:foodie/Orderspage/orders.dart';
import 'package:foodie/Restaurantswidget/restaurantpage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodie/navigation.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/authentication/screens/admin_home.dart';
import 'package:foodie/authentication/screens/delivary.dart';
import 'package:foodie/Home.dart';
import 'package:foodie/authentication/screens/register_page.dart';
import 'package:foodie/authentication/screens/profile_page.dart';
import 'package:foodie/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  double screenWidth =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
  DeviceOrientation initialOrientation = screenWidth > 600.0
      ? DeviceOrientation.landscapeLeft
      : DeviceOrientation.portraitUp;

  SystemChrome.setPreferredOrientations([initialOrientation]);
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ],
  // );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const RegisterPage()
          : const Navigation(),
      routes: {
        'home': (context) => Home(),
        'RegisterPage': (context) => const RegisterPage(),
        'userprofile': (context) => const Profilepage(),
        'admin_home': (context) => const Adminpage(),
        'delivery_home': (context) => const DelivaryPage(),
        'navigation': (context) => const Navigation(),
      },
    );
  }
}
