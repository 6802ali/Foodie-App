import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Order.dart' as OrderModel;

class OrderService {
  static Future<List<OrderModel.Order>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allOrderDocs =
        await FirestoreService.getAll(Collections.order);
    final List<OrderModel.Order> allOrderModels =
        OrderModel.Order.serviceDocumentListConvertor(allOrderDocs);

    return allOrderModels;
  }

  static Future<OrderModel.Order> getOrderById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> orderDoc =
        await FirestoreService.getDocumentById(Collections.order, documentId);
    final OrderModel.Order orderModel =
        OrderModel.Order.serviceDocumentConvertor(orderDoc);

    return orderModel;
  }

  static Future<List<OrderModel.Order>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<OrderModel.Order> documentsList = [];

    for (String documentId in documentIds) {
      OrderModel.Order documentSnapshot = await getOrderById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addOrder(OrderModel.Order order) {
    FirestoreService.addDoc(
      Collections.order,
      OrderModel.Order.serviceConstructor(order),
    );
  }

  static void updateOrder(OrderModel.Order order, String orderId) {
    FirestoreService.updateDoc(
      Collections.order,
      orderId,
      OrderModel.Order.serviceConstructor(order),
    );
  }

  static void deleteOrder(String orderId) {
    FirestoreService.deleteDoc(
      Collections.order,
      orderId,
    );
  }
}
