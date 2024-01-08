import 'package:flutter/material.dart';
import 'package:foodie/Reservationspage/reservation_cardbuilder.dart';
import 'package:foodie/Reservationspage/reservationdetails.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  // Use your own list of reservation data
  List<Map<String, dynamic>> reservationItems = [
    {
      'imagepath': 'assets/restaurant1.jpg',
      'restaurantname': 'Delicious Bites',
      'time': '7:30 PM',
      'date': 'Jan 15, 2023',
      'username': 'John Doe',
      'location': '123 Main St',
      'guests': 4,
    },
    // Add more reservation items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservations"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black // Light mode
              : Colors.white, // Dark mode
        ),
      ),
      body: ListView.builder(
        itemCount: reservationItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReservationDetailsPage(
                      reservation: reservationItems[index]),
                ),
              );
            },
            child: ReservationCardBuilder(
              reservation: reservationItems[index],
            ),
          );
        },
      ),
    );
  }
}
