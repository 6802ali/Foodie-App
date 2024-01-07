import 'package:flutter/material.dart';
import 'package:foodie/authentication/register_page_widgets/login_view.dart';
import 'package:foodie/authentication/register_page_widgets/welcome_message.dart';
import 'package:foodie/authentication/register_page_widgets/regestration_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
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
