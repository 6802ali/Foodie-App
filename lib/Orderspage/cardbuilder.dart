import 'package:flutter/material.dart';

class Cardbuilder extends StatelessWidget {
  final Map<String, dynamic> order;

  Cardbuilder({required this.order});

  @override
  Widget build(BuildContext context) {
    var imagepath = order['imagepath'];
    var restaurant_name = order['restaurantname'];
    var status = order['status'];
    var date = order['date'];
    var order_id = order['order_id'];

    return Card(
      elevation: 5,
      //color:
        //  Theme.of(context).cardColor, // Uses card color from the current theme
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
                image: AssetImage(imagepath), // Use order data
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                restaurant_name, // Use order data
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
                    status, // Use order data
                    style: TextStyle(
                      color: getStatusColor(status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date, // Use order data
                    style: TextStyle(
                      fontSize: 12,
                   //   color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Order ID: $order_id', // Use order data
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

// Function to map status to color
Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'successful':
      return Colors.green;
    case 'pending':
      return Colors.orange;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.black; // Default color if status is not recognized
  }
}
