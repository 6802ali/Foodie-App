// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foodie"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('userprofile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
