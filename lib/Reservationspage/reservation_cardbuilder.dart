import 'package:flutter/material.dart';

class ReservationCardBuilder extends StatelessWidget {
  final Map<String, dynamic> reservation;

  ReservationCardBuilder({required this.reservation});

  @override
  Widget build(BuildContext context) {
    var imagepath = reservation['imagepath'];
    var restaurantName = reservation['restaurantname'];
    var time = reservation['time'];
    var date = reservation['date'];
    var guests = reservation['guests'];

    return Card(
      elevation: 5,
      //color: Theme.of(context).cardColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagepath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                restaurantName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time: $time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      // color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Guests: $guests',
                    style: TextStyle(
                      fontSize: 12,
                      //  color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
