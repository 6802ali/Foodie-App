import 'package:flutter/material.dart';
import 'package:foodie/HomeWidgets/Navtabs.dart';
import 'package:foodie/Models/RestaurantModel.dart';
import 'package:foodie/Screens/Restaurantdetailswidgets/restaurantsdetails.dart';
import 'package:foodie/firebase/Restaurant.dart';

class allrestaurants extends StatefulWidget {
  const allrestaurants({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _allrestaurantsState createState() => _allrestaurantsState();
}

class _allrestaurantsState extends State<allrestaurants> {
  List<RestaurantModel> restaurants = [];

  Future getData() async {
    restaurants = await FireRestaurant.getAllRestaurants();
    // print("rest: " + restaurants[0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("error ali: " + snapshot.error.toString());
            return Center(
              child: Text("Something went wrong" + snapshot.error.toString()),
            );
          } else {
            return buildBody();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildBody() {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "All Restaurants",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return buildRestaurantCard(restaurants[index]);
              },
            ),
          ),
          Navtabs(),
        ],
      ),
    );
  }

  Widget buildRestaurantCard(RestaurantModel restaurant) {
    print("Image URL: ${restaurant.restaurant_img_link}");
    return Card(
        child: InkWell(
      /* onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailsPage(restaurant: restaurant)));
      }, */

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.network(
                Uri.encodeFull(restaurant.restaurant_img_link.trim()),
                width: 100,
                height: 120,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  restaurant.restaurantName,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 2),
                child: Text(
                  restaurant.field,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ),
                  Text(restaurant.rating.toString())
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
