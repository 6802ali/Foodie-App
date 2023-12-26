import 'package:cloud_firestore/cloud_firestore.dart';

class Access {
  final String id;
  final String type;

  Access({required this.id, required this.type});

  @override
  String toString() {
    return 'Access(id: $id, type: $type)';
  }

  static Access serviceDocumentConvertor(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return Access(id: document.id, type: data?['type']);
  }

  static List<Access> serviceDocumentListConvertor(
      List<DocumentSnapshot<Map<String, dynamic>>> list) {
    final List<Access> newList = [];
    for (DocumentSnapshot<Map<String, dynamic>> doc in list) {
      newList.add(Access.serviceDocumentConvertor(doc));
    }

    return newList;
  }

  static Map<String, dynamic> serviceConstructor({
    required String type,
  }) {
    return {
      'type': type,
    };
  }
}
