import 'package:flutter/material.dart';
import 'package:foodie/Reservationspage/reservation_cardbuilder.dart';
import 'package:foodie/Reservationspage/reservationdetails.dart';

class ViewReservations extends StatefulWidget {
  const ViewReservations({super.key});

  @override
  State<ViewReservations> createState() => _ViewReservationsState();
}

class _ViewReservationsState extends State<ViewReservations> {
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
