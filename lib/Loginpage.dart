import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Home.dart';
class LoginPage extends StatelessWidget {
  final PageController _controller = PageController();

  LoginPage({Key? key, required this.title, required PageController controller})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/Registeration.svg',
                width: 100,
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Welcome!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'Before enjoying Food Media services, please register first.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
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
              const SizedBox(height: 20),
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Home(),
                                    ));
                                  },
                                  child: const Text('Login'),
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
          ),
        ),
      ),
    );
  }
}
