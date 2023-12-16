import 'package:flutter/material.dart';
import 'package:flutter_application_1/register_page_widgets/regestration_view.dart';
import 'package:flutter_application_1/register_page_widgets/welcome_message.dart';
import 'package:flutter_application_1/register_page_widgets/login_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Media"),
        backgroundColor: const Color(0xFF32B768),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              WelcomMessage(),
              SizedBox(height: 20),
              CreateAccount(),
              SizedBox(height: 20),
              Login(),
            ],
          ),
        ),
      ),
    );
  }
}
