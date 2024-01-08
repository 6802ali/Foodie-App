import 'package:flutter/material.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Restaurant.dart';
import 'package:foodie/Firestore/Services/RestaurantService.dart';
import 'package:foodie/HomeWidgets/Navtabs.dart';
import 'package:foodie/Models/RestaurantModel.dart';
import 'package:foodie/Screens/Restaurantdetailswidgets/restaurantsdetails.dart';
import 'package:foodie/firebase/Restaurant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Restaurant> restaurants = [];
  List<Restaurant> displayList = [];

  @override
  void initState() {
    super.initState();
    /* getData(); */
  }

  Future<List<Restaurant>> getAllBySearch(String searchTerm) async {
    final firestore_restaurants =
        await RestaurantService.getAllByNameSearch(searchTerm);

    print('firestore_restaurants');
    print(firestore_restaurants);

    return firestore_restaurants;
  }

  Future getData(String searchTerm) async {
    restaurants = await RestaurantService.getAllByNameSearch(searchTerm);

    // Initialize displayList with all restaurants
    displayList = List.from(restaurants);
  }

  void updateList(String value) {
    getData(value);
    setState(() {
      // Check if the search value is not empty
      if (value.isNotEmpty) {
        // Filter the restaurants based on the search value
        displayList = restaurants
            .where((element) =>
                element.name!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        // If search value is empty, clear the displayList
        displayList.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Restaurant !",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              onChanged: ((value) => updateList(value)),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 221, 220, 224),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Mcdonalds",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.green.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  return buildRestaurantList(displayList[index]);
                },
              ),
            ),
            //Navtabs(),
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantList(Restaurant restaurant) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailsPage(restaurant: restaurant)));
      },
      contentPadding: EdgeInsets.all(8.0),
      title: Text(restaurant.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      subtitle: Text(
        restaurant.location,
        style: TextStyle(color: Colors.black),
      ),
      /* trailing: Text("${restaurant.rating}"), */
    );
  }
}
