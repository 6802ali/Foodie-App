// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/FirestoreService.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: library_prefixes
import '../../Firestore/Models/User.dart' as UserModel;
import '../validation.dart';

class RegistrationBottomSheet extends StatefulWidget {
  const RegistrationBottomSheet({Key? key}) : super(key: key);

  @override
  State<RegistrationBottomSheet> createState() =>
      _RegistrationBottomSheetState();
}

class _RegistrationBottomSheetState extends State<RegistrationBottomSheet> {
  final hidePassword = true.obs;

  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  static Future<String> getCustomerAccessId() async {
    final List<dynamic> list =
        await FirestoreService.getAccessByType('customer');
    final String accessstr = list[0].type;
    print('accessstr$accessstr');
    return accessstr;
  }

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: signupFormKey,
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
                  controller: fullName,
                  validator: (value) {
                    return Validation.validateFullName(value) ??
                        Validation.validateEmptyField('Full Name', value);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Enter Full Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: address,
                  validator: (value) {
                    return Validation.validateEmptyField('Address', value);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_location,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Enter Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: phoneNumber,
                  validator: (value) {
                    return Validation.validatePhoneNumber(value) ??
                        Validation.validateEmptyField('Phone Number', value);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    labelText: 'Enter Phone Number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    return Validation.validateEmptyField(
                            'Email Address', value) ??
                        Validation.validateEmail(value);
                  },
                  controller: emailAddress,
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
                    validator: (value) {
                      return Validation.validateEmptyField('Password', value) ??
                          Validation.validatePassword(value);
                    },
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
                      if (signupFormKey.currentState!.validate()) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailAddress.text,
                          password: password.text,
                        );
                        await FirestoreService.addUserWithId(
                          UserModel.User.serviceConstructor(
                              name: fullName.text,
                              email: emailAddress.text,
                              phone_number: phoneNumber.text,
                              address: address.text,
                              password: password.text,
                              access_id: await getCustomerAccessId()),
                          FirebaseAuth.instance.currentUser!.uid,
                        );
                        Navigator.of(context)
                            .pushReplacementNamed('navigation');
                      }
                    } on FirebaseAuthException catch (e) {
                      String errorMessage;
                      if (e.code == 'email-already-in-use') {
                        errorMessage =
                            'The account already exists for that email.';
                      } else if (e.code == 'weak-password') {
                        errorMessage = 'The password provided is too weak.';
                      } else {
                        errorMessage =
                            e.message ?? 'An unexpected error occurred.';
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
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
