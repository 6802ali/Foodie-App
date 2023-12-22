import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/screens/profile_page.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  File profile_image = 'assets/profile.png'as File;

  final picker = ImagePicker();
  Future _uploadImage() async {
    final uploadedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profile_image = File(uploadedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Profilepage(),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
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
              const SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.file(profile_image),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 90, top: 90),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: _uploadImage,
                        backgroundColor: const Color(0xFF32B768),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Edit your profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please provide your details to edit your profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Change Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF32B768),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(100, 35),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
