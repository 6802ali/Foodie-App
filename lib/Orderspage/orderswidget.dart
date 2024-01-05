import 'package:flutter/material.dart';

class OrdersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                      'assets/restaurant1.jpg'), // Replace with your image path
                  fit: BoxFit.cover),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Picture leading in the card

              SizedBox(height: 10), // Adjust spacing

              // Title
              Text(
                'Arrabiata',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              // Row with Status, Arrow Icon

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Successful',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Adjust spacing

                  // Arrow Icon
                  // Icon(Icons.arrow_forward),
                  // Status Text
                ],
              ),

              // Adjust spacing

              // Date and Order ID
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    'Jan 1, 2023',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10), // Adjust spacing

                  // Order ID
                  Text(
                    'Order ID: 12345',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
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
