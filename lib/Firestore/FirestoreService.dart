import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/Utilities.dart';

enum Collections { restaurant, user, review, reservation, order, meal, access }

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
      Collections colEnum) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);
    final QuerySnapshot<Map<String, dynamic>> colQuery = await col.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;

    return colDocs;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentById(
      Collections colEnum, String documentId) async {
    final String colName = colEnum.name;
    DocumentReference<Map<String, dynamic>> documentReference =
        firestore.collection(colName).doc(documentId);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();

    return documentSnapshot;
  }

  static Future<List<DocumentSnapshot<Map<String, dynamic>>>> getDocumentsByIds(
      List<String> documentIds, Collections colEnum) async {
    List<DocumentSnapshot<Map<String, dynamic>>> documentsList = [];

    for (String documentId in documentIds) {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await getDocumentById(colEnum, documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static Future<void> addDoc(
      Collections colEnum, Map<String, dynamic> newData) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    await col.add(newData);
  }

  static Future<void> addDocWithId(
      Collections colEnum, Map<String, dynamic> newData, String id) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    await col.doc(id).set(newData);
  }

  static Future<void> updateDoc(Collections colEnum, String docId,
      Map<String, dynamic> updatedData) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    await col.doc(docId).update(updatedData);
  }

  static Future<void> deleteDoc(Collections colEnum, String docId) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    await col.doc(docId).delete();
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllByConsumerId(
    Collections colEnum,
    String id,
  ) async {
    final String colName = colEnum.name;
    print('colName : ' + colName);
    print('id : ' + id);
    final col = firestore.collection(colName);

    final QuerySnapshot<Map<String, dynamic>> colQuery =
        await col.where('consumer_user_id', isEqualTo: id).get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;

    return colDocs;
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllByNameSearch(
    Collections colEnum,
    String searchTerm,
  ) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    final QuerySnapshot<Map<String, dynamic>> colQuery = await col
        .where('nameKeywords', arrayContains: searchTerm.toLowerCase())
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;

    return colDocs;
  }

  static Future<List<dynamic>> getAccessByType(
    String type,
  ) async {
    final String colName = Collections.access.name;
    final col = firestore.collection(colName);

    final QuerySnapshot<Map<String, dynamic>> colQuery =
        await col.where('type', isEqualTo: type).get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;

    return colDocs;
  }
}
