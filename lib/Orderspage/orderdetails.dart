import 'package:flutter/material.dart';
import 'package:foodie/Orderspage/cardbuilder.dart';
import 'package:foodie/Orderspage/orderswidget.dart';

// ignore: unnecessary_new

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            CardWidget(),
            DeliveryDetailsWidget(),
            OrderSummaryWidget(),
            CancelButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Cardbuilder(); // need id of card here
  }
}

class DeliveryDetailsWidget extends StatelessWidget {
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
                Text("name: First Text"),
                Text("street name: Second Text"),
                Text("building: Third Text"),
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
  @override
  Widget build(BuildContext context) {
    // Dummy list of items with quantity, name, and price
    List<Map<String, dynamic>> items = [
      {"quantity": 2, "name": "Item 1", "price": 20.00},
      {"quantity": 3, "name": "Item 2", "price": 15.00},
      {"quantity": 3, "name": "Item 3", "price": 25.00},
      {"quantity": 3, "name": "Item 3", "price": 25.00},
      {"quantity": 3, "name": "Item 3", "price": 25.00},
      {"quantity": 3, "name": "Item 3", "price": 25.00},
      {"quantity": 3, "name": "Item 3", "price": 25.00},
      // Add more items as needed
    ];

    // Calculate total cost
    double total = 0.0;
    for (var item in items) {
      total += item["price"] * item["quantity"];
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
              var item = items[index];
              var itemTotal = item["price"] * item["quantity"];
              return ListTile(
                leading: Text(
                  "${item['quantity']}X",
                ),
                title: Text("${item['name']}"),
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
        ListTile(
          title: Text(
            "Payment Method: Credit Card",
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
          backgroundColor: Colors.red, // Set the button color to red
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
