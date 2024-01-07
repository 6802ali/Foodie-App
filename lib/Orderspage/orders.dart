import 'package:flutter/material.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Orderspage/cardbuilder.dart';
import 'package:foodie/Orderspage/orderdetails.dart';
// import 'package:foodie/Orderspage/orderswidget.dart';

List<Map<String, dynamic>> cardItems = [
  {
    'imagepath': 'assets/restaurant1.jpg',
    'restaurantname': 'Arrabiata',
    'status': 'Successful',
    'date': 'Jan 1, 2023',
    'order_id': '12345',
    'username': 'sam',
    'address': 'ohio first',
    'phoneNumber': '+20 122 583996',
    'quantity': 3,
    'name': 'Item 2',
    'price': 15.00,
    'meals': {
      Meal(
        id: "rt4523",
        description: "Caramelized chicken sandwich with onion",
        name: "Chicken Sandwich",
        price: "120",
        restaurant_id: "234",
      ): 5,
      Meal(
        id: "rt4524",
        description: "Burger sandwich with cheese",
        name: "Burger Sandwich",
        price: "150",
        restaurant_id: "234",
      ): 3,
    },
  },
  {
    'imagepath': 'assets/restaurant2.jpg',
    'restaurantname': 'Pasta Carbonara',
    'status': 'Pending',
    'date': 'Feb 5, 2023',
    'order_id': '67890',
    'username': 'alice',
    'address': 'california second',
    'phoneNumber': '+20 122 583997',
    'quantity': 2,
    'name': 'Item 1',
    'price': 10.00,
    'meals': {
      Meal(
        id: "rt4525",
        description: "Classic Italian pasta with creamy sauce",
        name: "Pasta Carbonara",
        price: "80",
        restaurant_id: "235",
      ): 1,
    },
  },
  {
    'imagepath': 'assets/restaurant3.jpg',
    'restaurantname': 'Margherita Pizza',
    'status': 'Delivered',
    'date': 'Mar 10, 2023',
    'order_id': '11122',
    'username': 'bob',
    'address': 'new york third',
    'phoneNumber': '+20 122 583998',
    'quantity': 1,
    'name': 'Item 3',
    'price': 12.50,
    'meals': {
      Meal(
        id: "rt4526",
        description: "Classic pizza with tomato, mozzarella, and basil",
        name: "Margherita Pizza",
        price: "90",
        restaurant_id: "236",
      ): 1,
    },
  },
  {
    'imagepath': 'assets/restaurant4.jpg',
    'restaurantname': 'Chicken Alfredo',
    'status': 'Successful',
    'date': 'Apr 15, 2023',
    'order_id': '33445',
    'username': 'sara',
    'address': 'texas fourth',
    'phoneNumber': '+20 122 583999',
    'quantity': 4,
    'name': 'Item 4',
    'price': 20.00,
    'meals': {
      Meal(
        id: "rt4527",
        description: "Creamy pasta with grilled chicken",
        name: "Chicken Alfredo",
        price: "110",
        restaurant_id: "237",
      ): 4,
    },
  },
  {
    'imagepath': 'assets/restaurant5.jpg',
    'restaurantname': 'Sushi Combo',
    'status': 'Pending',
    'date': 'May 20, 2023',
    'order_id': '55667',
    'username': 'david',
    'address': 'arizona fifth',
    'phoneNumber': '+20 122 584000',
    'quantity': 2,
    'name': 'Item 5',
    'price': 18.00,
    'meals': {
      Meal(
        id: "rt4528",
        description: "Assorted sushi rolls",
        name: "Sushi Combo",
        price: "95",
        restaurant_id: "238",
      ): 2,
    },
  },
  {
    'imagepath': 'assets/restaurant6.jpg',
    'restaurantname': 'Vegetarian Salad',
    'status': 'Delivered',
    'date': 'Jun 25, 2023',
    'order_id': '77889',
    'username': 'emily',
    'address': 'florida sixth',
    'phoneNumber': '+20 122 584001',
    'quantity': 1,
    'name': 'Item 6',
    'price': 8.50,
    'meals': {
      Meal(
        id: "rt4529",
        description: "Fresh salad with assorted vegetables",
        name: "Vegetarian Salad",
        price: "65",
        restaurant_id: "239",
      ): 1,
    },
  },
];

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("orders"),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrderDetailsPage(order: cardItems[index]),
                ),
              );
            },
            child: Cardbuilder(
              order: cardItems[index],
            ),
          );
        },
      ),
    );
  }
}
