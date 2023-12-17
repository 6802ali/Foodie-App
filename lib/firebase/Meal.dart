import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Firemeal {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/");

  static Future getallmeals() async{
    final ref = rtdb.ref();
    final snapshot = await ref.child("Meal").get();
    if (snapshot.exists){
      print(snapshot.value);
    } else{
      print('no data available');
    }
  }

  static Future getmealbyid(String mealID) async{
    final ref = rtdb.ref();
    final snapshot = await ref.child("Meal/$mealID").get();
    if(snapshot.exists){
      print(snapshot.value);
    }else{
      print('no data available');
    }
  }

  static Future<void> createmeal(String mealID, {
    required String meal_description,
    required String meal_name,
    required double meal_price,
  }) async{
    final ref = rtdb.ref('Meal/$mealID');

    Map<String, dynamic> newData = {
      'meal_description': meal_description,
      'meal_name': meal_name,
      'meal_price': meal_price,
    };

    try{
      await ref.set(newData);
      print('insert successful !');
    }catch (error){
      print('Error inserting data: $error');
    }
  }

  static Future<void> updatemeal(String mealID,{
    required String? meal_description,
    required String? meal_name,
    required double? meal_price,
  })async{
    final ref = rtdb.ref('Meal/$mealID');

    Map<String, dynamic> newData = {};
    if (meal_description != null) newData['meal_description'] = meal_description;
    if (meal_name != null) newData['meal_name'] = meal_name;
    if (meal_price != null) newData['meal_price'] = meal_price;

    try{
      await ref.update(newData);
      print('updated successfully!');
    }catch(error){
      print('Error updating data: $error');
    }
  }

  static Future<void> deletemeal(String mealID) async{
    final ref = rtdb.ref('Users/$mealID');

    try{
      await ref.remove();
      print('Delete successful');
    }catch(error){
      print('Error deleting data: $error');
    }
  }

}
