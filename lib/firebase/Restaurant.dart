import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FireRestaurant {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/");

  static Future getallRestaurants() async {
    final ref = rtdb.ref();
    final snapshot = await ref.child("Restaurants").get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('no data available');
    }
  }

  static Future getRestaurantbyId(int restaurantID) async {
    final ref = rtdb.ref();
    final snapshot = await ref.child("Restaurants/$restaurantID").get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('no data available');
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
