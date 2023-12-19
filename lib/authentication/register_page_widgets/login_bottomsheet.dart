// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/register_page_widgets/sign_in_with_google.dart';
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
                      onPressed: () => hidePassword.value = !hidePassword.value,
                      icon: const Icon(Icons.visibility),
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
                if (email.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Email Address Can not be Empty',
                    btnOkOnPress: () {},
                  ).show();
                  return;
                } else if (email.text != '') {
                  if (email.text.contains('@') == false) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'Enter Valid Email Address',
                      btnOkOnPress: () {},
                    ).show();
                    return;
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Success',
                        desc: 'Password Reset Link Sent to your Email',
                        btnOkOnPress: () {},
                      ).show();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'No user found for that email.',
                        ).show();
                      }
                    }
                  }
                }
              },
              mouseCursor: SystemMouseCursors.click,
              child: Container(
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "Forgot Password ?",
                      ),
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
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.of(context).pushReplacementNamed('home');
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
                        errorMessage =
                            e.message ?? 'An unexpected error occurred.';
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
