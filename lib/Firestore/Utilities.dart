import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Firestore/Models/Reservation.dart';
import 'package:foodie/Firestore/Models/Restaurant.dart';
import 'package:foodie/Firestore/Models/Review.dart';
import 'package:foodie/Firestore/Models/User.dart';

import 'Models/Access.dart';
import 'Models/Order.dart' as OrderModel;

class Utilities {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static keywordsGenerator(String string) {
    final c = string.toLowerCase();
    final List<String> arr = [];
    // Forward substrings
    for (int i = 1; i < c.length + 1; i++) {
      arr.add(c.substring(0, i));
    }
    // Reverse substrings
    for (int i = c.length - 1; i > 0; i--) {
      arr.add(c.substring(i, c.length));
    }
    return arr;
  }

  static getAllModels(Collections colEnum,
      List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    switch (colEnum) {
      case Collections.restaurant:
        return Restaurant.serviceDocumentListConvertor(data);
      case Collections.access:
        return Access.serviceDocumentListConvertor(data);
      case Collections.meal:
        return Meal.serviceDocumentListConvertor(data);
      case Collections.order:
        return OrderModel.Order.serviceDocumentListConvertor(data);
      case Collections.reservation:
        return Reservation.serviceDocumentListConvertor(data);
      case Collections.review:
        return Review.serviceDocumentListConvertor(data);
      case Collections.user:
        return User.serviceDocumentListConvertor(data);
      default:
        print('ModelConvertor.getAll() Switch Case Default Error');
    }
  }

  static getModel(
      Collections colEnum, DocumentSnapshot<Map<String, dynamic>> data) {
    switch (colEnum) {
      case Collections.restaurant:
        return Restaurant.serviceDocumentConvertor(data);
      case Collections.access:
        return Access.serviceDocumentConvertor(data);
      case Collections.meal:
        return Meal.serviceDocumentConvertor(data);
      case Collections.order:
        return OrderModel.Order.serviceDocumentConvertor(data);
      case Collections.reservation:
        return Reservation.serviceDocumentConvertor(data);
      case Collections.review:
        return Review.serviceDocumentConvertor(data);
      case Collections.user:
        return User.serviceDocumentConvertor(data);
      default:
        print('ModelConvertor.getDocumentById() Switch Case Default Error');
    }
  }
}
