// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/authentication/screens/update_profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF32B768),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    'assets/profile.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mohammad',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mohmmed@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Account Information'),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Updateprofile(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.wallet_outlined,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Billing Information'),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('RegisterPage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
