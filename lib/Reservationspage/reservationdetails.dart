import 'package:flutter/material.dart';
import 'package:foodie/Reservationspage/reservation_cardbuilder.dart';

class ReservationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> reservation;
  ReservationDetailsPage({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReservationCardBuilder(reservation: reservation),
              SizedBox(height: 16),
              Divider(thickness: 2),
              SizedBox(height: 16),
              Text(
                'Reservation Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ReservationInfoWidget(reservation: reservation),
              SizedBox(height: 16),
              CancelButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationInfoWidget extends StatelessWidget {
  final Map<String, dynamic> reservation;

  ReservationInfoWidget({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Date'),
            subtitle: Text(reservation['date']),
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Time'),
            subtitle: Text(reservation['time']),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Guests'),
            subtitle: Text(reservation['guests'].toString()),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location'),
            subtitle: Text(reservation['location']),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Reserved By'),
            subtitle: Text(reservation['username']),
          ),
        ],
      ),
    );
  }
}

class CancelButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          showCancelWarningDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        child: Text("Cancel Reservation"),
      ),
    );
  }

  void showCancelWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cancel Reservation"),
          content: Text("Are you sure you want to cancel this reservation?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Implement cancellation logic here
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // return to main page
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
