// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/screens/admin_home.dart';
import 'package:flutter_application_1/authentication/screens/delivary.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/authentication/screens/register_page.dart';
import 'package:flutter_application_1/authentication/screens/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  } catch (e) {
    print('------------------Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const RegisterPage()
          : const Homepage(),
      routes: {
        'home': (context) => const Homepage(),
        'RegisterPage': (context) => const RegisterPage(),
        'userprofile': (context) => const Profilepage(),
        'admin_home': (context) => const Adminpage(),
        'delivery_home': (context) => const DelivaryPage(),
      },
    );
  }
}
