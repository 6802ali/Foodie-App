import 'package:flutter/material.dart';
import 'package:foodie/authentication/register_page_widgets/login_bottomsheet.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: const Text("Login"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              isScrollControlled: true,
              builder: (context) {
                return const LoginBottomSheet();
              },
            );
          },
        ),
      ],
    );
  }
}
