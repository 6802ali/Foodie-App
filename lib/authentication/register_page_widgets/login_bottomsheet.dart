// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/Firestore/Models/User.dart' as UserModel;
import 'package:foodie/Firestore/Services/UserService.dart';
import 'package:foodie/Riverpod.dart';
import 'package:foodie/authentication/register_page_widgets/sign_in_with_google.dart';
import 'package:foodie/authentication/validation.dart';
import 'package:get/get.dart';

class LoginBottomSheet extends ConsumerStatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends ConsumerState<LoginBottomSheet> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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
          Navigator.of(context).pushReplacementNamed('navigation');
        } else if (userAccess == 'delivery') {
          Navigator.of(context).pushReplacementNamed('delivery_home');
        } else {
          // Handle other roles or cases
          showErrorMessage('Invalid user role');
        }

        ref.read(userProvider.notifier).addUser(await UserService.getUserById(
            FirebaseAuth.instance.currentUser!.uid));

        print('ref.read(userProvider)');
        print(ref.read(userProvider));
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
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
   /*  ref.read(userProvider); */
  }

  @override
  Widget build(BuildContext context) {
    print('ref.watch(userProvider)');
    print(ref.watch(userProvider));
    return SingleChildScrollView(
      child: Form(
          key: loginFormKey,
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      return Validation.validateEmptyField(
                              'Email Address', value) ??
                          Validation.validateEmail(value);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
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
                      validator: (value) {
                        return Validation.validateEmptyField(
                                'Password', value) ??
                            Validation.validatePassword(value);
                      },
                      obscureText: hidePassword.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
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
                      if (loginFormKey.currentState!.validate()) {
                        try {
                          loginUserAndNavigate();
                        } catch (e) {
                          print(e.toString());
                        }
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
