import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String id;
  final String address;
  final String status;
  final List<String> meals_id;
  final String admin_user_id;
  final String consumer_user_id;
  final String delivery_user_id;
  final String restaurant_id;

  Order({
    required this.id,
    required this.address,
    required this.status,
    required this.meals_id,
    required this.admin_user_id,
    required this.consumer_user_id,
    required this.delivery_user_id,
    required this.restaurant_id,
  });

  @override
  String toString() {
    return 'Order(id: $id, address: $address, status: $status, admin_user_id: $admin_user_id, consumer_user_id: $consumer_user_id, delivery_user_id: $delivery_user_id, restaurant_id: $restaurant_id,)';
  }

  static Order serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Order(
      id: document.id,
      address: data?['address'],
      status: data?['status'],
      meals_id: data?['meals_id'],
      admin_user_id: data?['admin_user_id'],
      consumer_user_id: data?['consumer_user_id'],
      delivery_user_id: data?['delivery_user_id'],
      restaurant_id: data?['restaurant_id'],
    );
  }

  static List<Order> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Order> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Order.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor(Order order) {
    return {
      'address': order.address,
      'status': order.status,
      'meals_id': order.meals_id,
      'admin_user_id': order.admin_user_id,
      'consumer_user_id': order.consumer_user_id,
      'delivery_user_id': order.delivery_user_id,
      'restaurant_id': order.restaurant_id,
    };
  }
}
