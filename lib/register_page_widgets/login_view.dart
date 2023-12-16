import 'package:flutter/material.dart';
import 'package:flutter_application_1/register_page_widgets/login_bottomsheet.dart';

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
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF10B981),
            backgroundColor: const Color(0xFFD1FAE5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(256, 49),
          ),
          child: const Text("Login"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              backgroundColor: Colors.white,
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
