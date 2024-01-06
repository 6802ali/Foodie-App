import 'package:flutter/material.dart';
import 'package:foodie/Orderspage/cardbuilder.dart';
import 'package:foodie/Orderspage/orderdetails.dart';
// List<Map<String, dynamic>> cardItems = [
//   {
//     'name': 'arabiata',
//     'status': 'successful',
//     'date': 'jan 1 ,2023',
//     'id': '134', // Replace with your image URL
//   },
//   {
//     'name': 'arabiata',
//     'status': 'successful',
//     'date': 'jan 1 ,2023',
//     'id': '134', // Replace with your image URL
//   },
//   {
//     'name': 'arabiata',
//     'status': 'successful',
//     'date': 'jan 1 ,2023',
//     'id': '134', // Replace with your image URL
//   },
//   {
//     'name': 'arabiata',
//     'status': 'successful',
//     'date': 'jan 1 ,2023',
//     'id': '134', // Replace with your image URL
//   },
//   {
//     'name': 'arabiata',
//     'status': 'successful',
//     'date': 'jan 1 ,2023',
//     'id': '134', // Replace with your image URL
//   },

//   // Add more items as needed
// ];

class OrdersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsPage(),
          ),
        );
      },
      child: Cardbuilder(),
    );
  }
}
