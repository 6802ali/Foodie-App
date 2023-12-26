import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeWidgets/Navtabs.dart';
import 'package:flutter_application_1/Models/RestaurantModel.dart';
import 'package:flutter_application_1/firebase/Restaurant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RestaurantModel> restaurants = [];
  List<RestaurantModel> displayList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    restaurants = await FireRestaurant.getAllRestaurants();
    // Initialize displayList with all restaurants
    displayList = List.from(restaurants);
  }

  void updateList(String value) {
  setState(() {
    // Check if the search value is not empty
    if (value.isNotEmpty) {
      // Filter the restaurants based on the search value
      displayList = restaurants
          .where((element) =>
              element.restaurantName!
                  .toLowerCase()
                  .contains(value.toLowerCase()))
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
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
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
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: ((value) => updateList(value)),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 221, 220, 224),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Macdonalds",
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
            Navtabs(),
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantList(RestaurantModel restaurant) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      title: Text(restaurant.restaurantName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(
        restaurant.field,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Text("${restaurant.rating}"),
    );
  }
}