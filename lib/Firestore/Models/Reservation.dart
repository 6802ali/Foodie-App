import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String id;
  final DateTime timestamp;
  final String user_id;
  final String restaurant_id;

  Reservation({
    required this.id,
    required this.timestamp,
    required this.user_id,
    required this.restaurant_id,
  });

  @override
  String toString() {
    return 'Reservation(id: $id, timestamp: $timestamp, user_id: $user_id), restaurant_id: $restaurant_id)';
  }

  static Reservation serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Reservation(
      id: document.id,
      timestamp: data?['timestamp'],
      user_id: data?['user_id'],
      restaurant_id: data?['restaurant_id'],
    );
  }

  static List<Reservation> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Reservation> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Reservation.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required DateTime timestamp,
    required String user_id,
    required String restaurant_id,
  }) {
    return {
      'timestamp': timestamp,
      'user_id': user_id,
      'restaurant_id': restaurant_id,
    };
  }
}
