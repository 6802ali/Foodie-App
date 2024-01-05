import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone_number;
  final String address;
  final String access_id;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone_number,
      required this.address,
      required this.password,
      required this.access_id});

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone_number: $phone_number, address: $address, access_id: $access_id,)';
  }

  static User serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return User(
      id: document.id,
      name: data?['name'],
      password: data?['password'],
      address: data?['address'],
      email: data?['email'],
      phone_number: data?['phone_number'],
      access_id: data?['access_id'],
    );
  }

  static List<User> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<User> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(User.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required String name,
    required String email,
    required String phone_number,
    required String address,
    required String access_id,
    required String password,
  }) {
    return {
      'name': name,
      'email': email,
      'phone_number': phone_number,
      'address': address,
      'access_id': access_id,
      'password': password,
    };
  }
}
