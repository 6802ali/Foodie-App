import 'package:flutter/material.dart';
import 'package:foodie/Orderspage/orderswidget.dart';

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
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrdersWidget();
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
