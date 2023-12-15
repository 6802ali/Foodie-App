import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase before building the app
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Firebase has been initialized, build your app
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: RegisterPage(),
          );
        } else if (snapshot.hasError) {
          // Handle Firebase initialization error
          return ErrorWidget("Error initializing Firebase: ${snapshot.error}");
        } else {
          // Firebase is still initializing, show a loading text
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading...'),
              ),
            ),
          );
        }
      },
    );
  }
}
