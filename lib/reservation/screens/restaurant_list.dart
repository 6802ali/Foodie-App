import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/reservation/widgets/category_select.dart';

class restaurant_list extends StatefulWidget {
  const restaurant_list({super.key});

  @override
  State<restaurant_list> createState() => _restaurant_listState();
}

class _restaurant_listState extends State<restaurant_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "restaurants",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Categories(categoryname: [
              "all",
              "uwuw",
              "italian",
              "mexican",
              "all",
              "uwuw",
              "italian",
              "mexican"
            ])
          ],
        ));
  }
}
