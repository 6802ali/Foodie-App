import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  final String id;
  final String description;
  final String name;
  final String price;
  final String restaurant_id;

  Meal(
      {required this.id,
      required this.description,
      required this.name,
      required this.price,
      required this.restaurant_id});

  @override
  String toString() {
    return 'Access(id: $id, name: $name, description: $description, price: $price,)';
  }

  static Meal serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Meal(
      id: document.id,
      description: data?['description'],
      name: data?['name'],
      price: data?['price'],
      restaurant_id: data?['restaurant_id'],
    );
  }

  static List<Meal> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Meal> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Meal.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required String name,
    required String description,
    required String price,
    required String restaurant_id,
  }) {
    return {
      'name': name,
      'description': description,
      'price': price,
      'restaurant_id': restaurant_id,
    };
  }
}
