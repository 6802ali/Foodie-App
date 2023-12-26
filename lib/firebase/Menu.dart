import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Firemenu {
  static final firebaseApp = Firebase.app();
  static final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: "https://project-b2728-default-rtdb.firebaseio.com/");

  static Future getallmenus() async {
    final ref = rtdb.ref();
    final snapshot = await ref.child("Menu").get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('no data available');
    }
  }
}
