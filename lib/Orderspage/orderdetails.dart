import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Orderspage/cardbuilder.dart';

// ignore: unnecessary_new
// var username;
// var address;
// var phoneNumber;
// late String quantity;
// late String name;
// late String price;

// Add more items as needed

class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;
  OrderDetailsPage({required this.order});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: Column(
          children: [
            CardWidget(order: order),
            DeliveryDetailsWidget(order: order),
            OrderSummaryWidget(order: order),
            CancelButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Map<String, dynamic> order;

  CardWidget({required this.order});
  @override
  Widget build(BuildContext context) {
    return Cardbuilder(order: order); // need id of card here
  }
}

class DeliveryDetailsWidget extends StatelessWidget {
  final Map<String, dynamic> order;

  DeliveryDetailsWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Delivery Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Center(
            child: Column(
              children: [
                Text("name: ${order['username']}"), // Use order data
                Text("Address: ${order['address']}"), // Use order data
                Text("phone number: ${order['phoneNumber']}"), // Use order data
                // Add more Text widgets as needed
              ],
            ),
          ),
          trailing: Icon(Icons.location_on),
        ),
        // Displaying address information as Text
      ],
    );
  }
}

class OrderSummaryWidget extends StatelessWidget {
  final Map<String, dynamic> order;

  OrderSummaryWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    // Use order data instead of the dummy list
    Map<Meal, int> items = order['meals'];

    // Calculate total cost
    int total = 0;

    for (var entry in items.entries) {
      total += (entry.key.price * entry.value);
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            "Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              var currentitem = items.entries.toList()[index];
              Meal item = currentitem.key;
              int quantity = currentitem.value;
              int itemTotal = (item.price * quantity) as int;
              return ListTile(
                leading: Text(
                  "${quantity}X",
                ),
                title: Text("${item.name}"),
                trailing: Text("\$${itemTotal.toStringAsFixed(2)}"),
              );
            },
          ),
        ),
        ListTile(
          title: Text(
            "Total: \$${total.toStringAsFixed(2)}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
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
          foregroundColor: Theme.of(context).cardColor,
          // Set the button color to red
        ),
        child: Text("Cancel Order"),
      ),
    );
  }

  void showCancelWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cancel Order"),
          content: Text("Are you sure you want to cancel this order?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Implement cancellation logic here

                Navigator.pop(context); //close dialog
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
