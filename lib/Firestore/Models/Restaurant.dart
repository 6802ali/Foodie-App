import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String id;
  final String name;
  final String location;
  final List<dynamic> meals_id;
  final List<dynamic> reservations_id;
  final List<dynamic> reviews_id;

  Restaurant({
    required this.id,
    required this.name,
    required this.location,
    required this.meals_id,
    required this.reservations_id,
    required this.reviews_id,
  });

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, location: $location)';
  }

  static Restaurant serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Restaurant(
      id: document.id,
      name: data?['name'],
      location: data?['location'],
      meals_id: data?['meals_id'],
      reservations_id: data?['reservations_id'],
      reviews_id: data?['reviews_id'],
    );
  }

  static List<Restaurant> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Restaurant> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Restaurant.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required String name,
    required String location,
    required List<String> meals_id,
    List<String> reservations_id = const [],
    List<String> reviews_id = const [],
  }) {
    return {
      'name': name,
      'location': location,
      'meals_id': meals_id,
      'reservations_id': reservations_id,
      'reviews_id': reviews_id,
    };
  }
}
