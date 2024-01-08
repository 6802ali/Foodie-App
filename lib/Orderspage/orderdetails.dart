import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Firestore/Models/User.dart' as UserModel;
import 'package:foodie/Firestore/Models/Order.dart';
import 'package:foodie/Firestore/Services/MealService.dart';
import 'package:foodie/Firestore/Services/OrderService.dart';
import 'package:foodie/Firestore/Services/UserService.dart';
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
  final Order orderobj;

  OrderDetailsPage({required this.orderobj});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardWidget(orderobj: orderobj),
              DeliveryDetailsWidget(orderobj: orderobj),
              OrderSummaryWidget(orderobj: orderobj),
              if (orderobj.status != 'Cancelled')
                CancelButtonWidget(orderobj: orderobj),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Order orderobj;

  CardWidget({required this.orderobj});
  @override
  Widget build(BuildContext context) {
    return Cardbuilder(orderobj: orderobj); // need id of card here
  }
}

class DeliveryDetailsWidget extends StatelessWidget {
  final Order orderobj;

  Future<UserModel.User> getConsumer(String id) {
    return UserService.getUserById(id);
  }

  DeliveryDetailsWidget({required this.orderobj});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(
          "Delivery Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Center(
          child: FutureBuilder(
            future: getConsumer(orderobj.consumer_user_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(children: [
                  Text("name: " + snapshot.data!.name), // Use order data
                  Text("Address: ${orderobj.address}"), // Use order data
                  Text("phone number: " +
                      snapshot.data!.phone_number), // Use order data
                  // Add more Text widgets as needed
                ]);
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
        ),
        trailing: Icon(Icons.location_on),
      ),
    ]);
  }
}

class OrderSummaryWidget extends StatelessWidget {
  final Order orderobj;

  OrderSummaryWidget({required this.orderobj});

  Future<List<Meal>> getMeals(List<dynamic> mealsIds) {
    return MealService.getAllByIds(mealsIds);
  }

  @override
  Widget build(BuildContext context) {
    int calculateOrderTotal(List<Meal> meals) {
      int total = 0;
      for (Meal meal in meals) {
        total += (meal.price);
      }
      return total;
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
          child: FutureBuilder(
            future: getMeals(orderobj.meals_id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var currentitem = snapshot.data![index];
                    /* Meal item = currentitem.key;
                    int quantity = currentitem.value;
                    int itemTotal = (item.price * quantity) as int; */
                    return ListTile(
                      /* leading: Text(
                        "${quantity}X",
                      ), */
                      title: Text("${currentitem.name}"),
                      trailing: Text(currentitem.price.toString()),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                // Handle error
                return Text('Error loading order meals');
              } else {
                // Return a loading indicator or placeholder
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        FutureBuilder(
          future: getMeals(orderobj.meals_id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final mealslist = snapshot.data!;
              return ListTile(
                title: Text(
                  "Total: " + calculateOrderTotal(mealslist).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            } else if (snapshot.hasError) {
              // Handle error
              return Text('Error loading order meals');
            } else {
              // Return a loading indicator or placeholder
              return CircularProgressIndicator();
            }
          },
        ),
        /*  */
      ],
    );
  }
}

class CancelButtonWidget extends StatelessWidget {
  final Order orderobj;

  CancelButtonWidget({required this.orderobj});
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
                OrderService.updateOrder(
                    Order(
                      id: orderobj.id,
                      address: orderobj.address,
                      status: 'Cancelled',
                      meals_id: orderobj.meals_id,
                      admin_user_id: orderobj.admin_user_id,
                      consumer_user_id: orderobj.consumer_user_id,
                      delivery_user_id: orderobj.delivery_user_id,
                      restaurant_id: orderobj.restaurant_id,
                    ),
                    orderobj.id);
                Navigator.pop(context); //close dialog
                Navigator.pop(context); // return to main page
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
