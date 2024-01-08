import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Access.dart';

class AccessService {
  static Future<List<Access>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allAccessDocs =
        await FirestoreService.getAll(Collections.access);
    final List<Access> allAccessModels =
        Access.serviceDocumentListConvertor(allAccessDocs);

    return allAccessModels;
  }

  static Future<Access> getAccessById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> accessDoc =
        await FirestoreService.getDocumentById(Collections.access, documentId);
    final Access accessModel = Access.serviceDocumentConvertor(accessDoc);

    return accessModel;
  }

  static Future<List<Access>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<Access> documentsList = [];

    for (String documentId in documentIds) {
      Access documentSnapshot = await getAccessById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addAccess(Access access) {
    FirestoreService.addDoc(
      Collections.access,
      Access.serviceConstructor(access),
    );
  }

  static void updateAccess(Access access, String accessId) {
    FirestoreService.updateDoc(
      Collections.access,
      accessId,
      Access.serviceConstructor(access),
    );
  }

  static void deleteAccess(String accessId) {
    FirestoreService.deleteDoc(
      Collections.access,
      accessId,
    );
  }
}
