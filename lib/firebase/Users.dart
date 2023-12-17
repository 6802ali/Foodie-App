import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Firetest {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/");

  static Future getbyid(String userId) async {
    final ref = rtdb.ref();
    final snapshot = await ref.child('Users/$userId').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  static Future getall() async {
    final ref = rtdb.ref();
    final snapshot = await ref.child('Users').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  static Future<void> update(
      String userId,
      {int? age, String? email,String? firstName, String? lastName,  String? password}) async {
    final ref = rtdb.ref('Users/$userId');

    Map<String, dynamic> newData = {};
    if (age != null) newData['age'] = age;
    if (email != null) newData['email'] = email;
    if (firstName != null) newData['firstName'] = firstName;
    if (lastName != null) newData['lastName'] = lastName;
    if (password != null) newData['password'] = password;

    try {
      await ref.update(newData);
      print('Update successful.');
    } catch (error) {
      print('Error updating data: $error');
    }
  }

  static Future<void> insert(
    String userId,
    {  
    required int age,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final ref = rtdb.ref('Users/$userId');

    Map<String, dynamic> newData = {
      'age': age,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };

    try {
      await ref.set(newData);
      print('Insert successful.');
    } catch (error) {
      print('Error inserting data: $error');
    }
  }

  static Future<void> delete(String userId) async {
    final ref = rtdb.ref('Users/$userId');

    try {
      await ref.remove();
      print('Delete successful.');
    } catch (error) {
      print('Error deleting data: $error');
    }
  }
}