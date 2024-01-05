import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Orderspage/orders.dart';
import 'package:foodie/Orderspage/orderswidget.dart';
import 'package:foodie/Screens/booked_restaurants.dart';
import 'package:foodie/navigation.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/authentication/screens/admin_home.dart';
import 'package:foodie/authentication/screens/delivary.dart';
import 'package:foodie/Home.dart';
import 'package:foodie/authentication/screens/register_page.dart';
import 'package:foodie/authentication/screens/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirestoreService.getAll(Collections.restaurant);

  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const RegisterPage()
          : const Navigation() //page contains navigation to all the pages//
      ,
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
