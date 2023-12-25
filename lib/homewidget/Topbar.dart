import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/UserModel.dart';
import 'package:flutter_application_1/firebase/Users.dart';

class Topbar extends StatefulWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  List<UserModel> Users = [];

  Future getData() async {
    Users = await Firetest.getall();
    // print("rest: " + restaurants[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("error: " + snapshot.error.toString());
            return Center(
              child: Text("Something went wrong" + snapshot.error.toString()),
            );
          } else {
            return buildBody();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

 Widget buildBody() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello ' + Users[0].firstname + '!',
              style: TextStyle(fontSize: 24),
            ),
            Icon(
              Icons.shopping_cart,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
