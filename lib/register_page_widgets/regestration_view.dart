import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF32B768),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(256, 49),
          ),
          child: const Text("Create Account"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              backgroundColor: Colors.white,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
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
                        const ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Full Name"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Full Name',
                            ),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email Address"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Email Address',
                            ),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.lock),
                          title: Text("Password"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password',
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
                                borderRadius: BorderRadius.circular(0),
                              ),
                              minimumSize: const Size(256, 49),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Registration'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
