import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/Models/RestaurantModel.dart';
import 'package:http/http.dart' as http;

class FireRestaurant {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/",);

//   static Future<List<RestaurantModel>> getallRestaurants() async {
//   final ref = rtdb.ref();
//   final DataSnapshot snapshot = await ref.child("Restaurants").get();
//   List<RestaurantModel> restaurants = [];

//   if (snapshot.exists) {
//     List<dynamic>? values = snapshot.value as List<dynamic>?;

//     if (values != null) {
//       for (var value in values) {
//         if (value != null && value is Map<String, dynamic>) {
//           restaurants.add(RestaurantModel.fromJson(value));
//         }
//       }
//     }
//   } else {
//     print('no data available');
//   }

//   return restaurants;
// }

  static Future<List<RestaurantModel>> getAllRestaurants() async {
    List<RestaurantModel> restaurants = [];
    try {
      final response = await http.get(Uri.parse('https://project-b2728-default-rtdb.firebaseio.com/Restaurants.json'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print(data);
        // check if item is not null before adding to the list
        data.forEach((item) {
          if (item != null) {
            restaurants.add(RestaurantModel.fromJson(item));
          }
        });
        return restaurants;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  static Future<dynamic> getMeals(String restaurantId) async {
  final restaurantRef = rtdb.ref('Restaurants/$restaurantId');
  final snapshot = await restaurantRef.get();

  if (snapshot.exists) {
    // Check if 'snapshot.value' is not null before accessing its fields
    if (snapshot.value != null) {
      final Map<String, dynamic>? restaurantData = snapshot.value as Map<String, dynamic>?;

      if (restaurantData != null) {
        final Map<String, dynamic>? menu = restaurantData['menu'];
        final List<dynamic>? meals = menu != null ? menu['meals'] : null;

        if (meals != null) {
          print(meals);
          // return meals;
        } else {
          print('The "menu" or "meals" field does not exist in the snapshot.value');
          return null;
        }
      } else {
        print('The snapshot.value is null');
        return null;
      }
    } else {
      print('The snapshot.value is null');
      return null;
    }
  } else {
    print('No data available');
    return null;
  }
}


}
