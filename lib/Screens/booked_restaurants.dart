import 'package:flutter/material.dart';

import 'package:foodie/Restaurantswidget/booked_restaurants_widget/restaurant_widget.dart';

class BookedRestaurants extends StatelessWidget {
  const BookedRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Booked Restaurants"),
          actions: [],
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return RestaurantWidget(
                  imagePath: "imagePath", title: "title", address: "address");
            })
        // RestaurantWidget(
        //     imagePath: "imagePath",
        //     title: "title",
        //     location: "location",
        //     address: "address")

        );
  }
}