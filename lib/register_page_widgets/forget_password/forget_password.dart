import 'package:flutter/material.dart';

class forget_password extends StatefulWidget {
  const forget_password({super.key});

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Forget Password'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 50),

              //this text changes with the textfield name
              Text(
                "enter email address",
                style: TextStyle(color: Colors.grey[700], fontSize: 32),
              ),

              //const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 200, horizontal: 200),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700),
                      )),
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
                    minimumSize: const Size(256, 49),
                  ),
                  onPressed: () {
                    // Navigator.of(context) .pushReplacementNamed('');
                  },
                  child: const Text('next'),
                ),
              ),
            ]),
          ),
        ));
  }
}
