// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/authentication/register_page_widgets/sign_in_with_google.dart';
import 'package:get/get.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;

  // Helper function to show an error message
  void showErrorMessage(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  // Helper function to show a success message
  void showSuccessMessage(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> loginUserAndNavigate() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Fetch user data from Firestore
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(credential.user!.uid)
          .get();

      print('Document Data: ${documentSnapshot.data()}');

      if (documentSnapshot.exists) {
        // Explicit casting to Map<String, dynamic>
        Map<String, dynamic>? userData =
            documentSnapshot.data() as Map<String, dynamic>?;

        if (userData == null) {
          print('User data is null');
          return;
        }

        // Access the 'role' field with the null-aware operator
        String? userAccess = userData['access_id'] as String?;

        // Navigate based on user role
        if (userAccess == 'admin') {
          Navigator.of(context).pushReplacementNamed('admin_home');
        } else if (userAccess == 'customer') {
          Navigator.of(context).pushReplacementNamed('home');
        } else if (userAccess == 'delivery') {
          Navigator.of(context).pushReplacementNamed('delivery_home');
        } else {
          // Handle other roles or cases
          showErrorMessage('Invalid user role');
        }
      } else {}
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'invalid-credential':
        case 'channel-error':
          errorMessage = 'Enter Valid Information';
          break;
        default:
          errorMessage = e.message ?? 'An unexpected error occurred.';
          break;
      }
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: errorMessage,
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_drop_down,
                size: 36,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  labelText: 'Enter Email Address',
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: password,
                  obscureText: hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidePassword.value = !hidePassword.value;
                      },
                      icon: Icon(
                        hidePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Enter Password',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (email.text.isEmpty) {
                  showErrorMessage('Please enter your email address');
                  return;
                }
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text);
                  showSuccessMessage(
                      'Password reset link has been sent to your email address');
                } catch (e) {
                  showErrorMessage('Failed to send reset email');
                  return;
                }
              },
              mouseCursor: SystemMouseCursors.click,
              child: Container(
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text("Forgot Password ?"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF32B768),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: const Size(200, 49),
                ),
                onPressed: () async {
                  try {
                    loginUserAndNavigate();
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: const Text('Login'),
              ),
            ),
            const Text('OR'),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 10),
                child: Google())
          ],
        ),
      )),
    );
  }
}
