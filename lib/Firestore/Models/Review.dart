import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String description;
  final String rating;
  final String restaurant_id;
  final String user_id;

  Review(
      {required this.id,
      required this.description,
      required this.rating,
      required this.restaurant_id,
      required this.user_id});

  @override
  String toString() {
    return 'Review(id: $id, description: $description, rating: $rating, rating: $rating, restaurant_id: $restaurant_id, user_id: $user_id,)';
  }

  static Review serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Review(
      id: document.id,
      description: data?['description'],
      rating: data?['rating'],
      restaurant_id: data?['restaurant_id'],
      user_id: data?['user_id'],
    );
  }

  static List<Review> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Review> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Review.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required String rating,
    required String description,
    required String restaurant_id,
    required String user_id,
  }) {
    return {
      'rating': rating,
      'description': description,
      'restaurant_id': restaurant_id,
      'user_id': user_id,
    };
  }
}
