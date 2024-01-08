import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodie/Models/MealModel.dart';
import 'package:foodie/Models/MenuModel.dart';
import 'package:foodie/Models/RestaurantModel.dart';
import 'package:http/http.dart' as http;

class FireRestaurant {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/",
  );

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
  
      final response = await http.get(Uri.parse(
          'https://project-b2728-default-rtdb.firebaseio.com/Restaurants.json'));
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
  }

static Future<List<MenuModel>> getRestaurantMenu(int restaurantId) async {
  List<MenuModel> menu = [];
  try {
    final response = await http.get(Uri.parse('https://project-b2728-default-rtdb.firebaseio.com/Restaurants/$restaurantId/menu/meals.json'));

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      print(data);
      if (data != null && data is List<dynamic>) {
        // Iterate over the meals data
        for (dynamic mealData in data) {
          if (mealData != null) {
            menu.add(MenuModel.fromJson(mealData));
          }
        }
        return menu;
      } else {
        print('Menu data is null or not in the expected format.');
        return [];
      }
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}


  static Future<List<MenuModel>> getMeals(int restaurantId) async {
    final restaurantRef = rtdb.ref('Restaurants/$restaurantId');
    final snapshot = await restaurantRef.get();

    if (snapshot.exists) {
      final Map<String, dynamic>? restaurantData =
          snapshot.value as Map<String, dynamic>?;

      if (restaurantData != null) {
        final Map<String, dynamic>? menu =
            restaurantData['menu'] as Map<String, dynamic>?;

        if (menu != null) {
          final List<dynamic>? meals = menu['meals'] as List<dynamic>?;

          if (meals != null) {
            List<MenuModel> menuList = meals
                .whereType<Map<String, dynamic>>()
                .map<MenuModel>((meal) => MenuModel.fromJson(meal))
                .toList();
            return menuList;
          } else {
            print('The "meals" field does not exist in the menu');
            return [];
          }
        } else {
          print('The "menu" field does not exist in the snapshot.value');
          return [];
        }
      } else {
        print('The snapshot.value is null');
        return [];
      }
    } else {
      print('No data available');
      return [];
    }
  }



  // ------------------------------------------->
   static Future<List<Map<String, dynamic>>> getMealsForRestaurant(int restaurantId) async {
    try {
      final response = await http.get(Uri.parse('https://project-b2728-default-rtdb.firebaseio.com/Restaurants/$restaurantId/menu.json'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data is Map<String, dynamic> && data['meals'] != null) {
          final List<dynamic> mealsData = data['meals'];
          return List<Map<String, dynamic>>.from(mealsData);
        } else {
          print('Menu data is null or meals field is missing.');
          return []; // Return an empty list when data is null or not a Map<String, dynamic>
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
