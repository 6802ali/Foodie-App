import 'package:flutter/material.dart';

class ViewReservations extends StatefulWidget {
  const ViewReservations({super.key});

  @override
  State<ViewReservations> createState() => _ViewReservationsState();
}

class _ViewReservationsState extends State<ViewReservations> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('View all Reservations'),
      ),
    );
  }
}
