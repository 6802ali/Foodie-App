import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Order.dart';
import 'package:foodie/Firestore/Services/OrderService.dart';
import 'package:foodie/Firestore/Services/RestaurantService.dart';

class Cardbuilder extends StatelessWidget {
  final Order orderobj;

  Cardbuilder({required this.orderobj});

  @override
  Widget build(BuildContext context) {
    Future<String> getImage() async {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final String restaurantImage =
          'gs://project-b2728.appspot.com/restaurants/' +
              orderobj.restaurant_id +
              '.png';

      String image = await storage.refFromURL(restaurantImage).getDownloadURL();

      return image;
    }

    /* var restaurant_name = order['restaurantname'];
    var status = order['status'];
    var date = order['date'];
    var order_id = order['order_id']; */

    return Card(
      elevation: 5,
      //color:
      //  Theme.of(context).cardColor, // Uses card color from the current theme
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder(
            future: getImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.network(
                  snapshot.data.toString(),
                  width: 100,
                  fit: BoxFit.cover,
                );
              } else if (snapshot.hasError) {
                // Handle error
                return Text('Error loading image');
              } else {
                // Return a loading indicator or placeholder
                return CircularProgressIndicator();
              }
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FutureBuilder(
                future:
                    RestaurantService.getRestaurantById(orderobj.restaurant_id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      snapshot.data!.name, // Use order data
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // Handle error
                    return Text('Error loading image');
                  } else {
                    // Return a loading indicator or placeholder
                    return CircularProgressIndicator();
                  }
                },
              ),
              /*  */
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderobj.status, // Use order data
                    style: TextStyle(
                      color: getStatusColor(orderobj.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderobj.address, // Use order data
                    style: TextStyle(
                      fontSize: 12,
                      //   color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Order ID: ' + orderobj.id, // Use order data
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
    case 'completed':
      return Colors.green;
    case 'pending':
      return Colors.orange;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.black; // Default color if status is not recognized
  }
}
