import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_demo/Firestore/Utilities.dart';

enum Collections { restaurant, user, review, reservation, order, meal, access }

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<dynamic>> getAll(Collections colEnum) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);
    final QuerySnapshot<Map<String, dynamic>> colQuery = await col.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;
    final result = Utilities.getAllModels(colEnum, colDocs);

    try {
      print('FirestoreService.getAll:' + colName);
      for (dynamic document in result) {
        print(document);
      }
    } catch (error) {
      print('Error during FirestoreService.getAll: $error');
    }

    return result;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentById(
      Collections colEnum, String documentId) async {
    final String colName = colEnum.name;
    DocumentReference<Map<String, dynamic>> documentReference =
        firestore.collection(colName).doc(documentId);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();
    final result = Utilities.getModel(colEnum, documentSnapshot);

    try {
      print('FirestoreService.getDocumentById:' + documentId);
      print(result);
    } catch (error) {
      print('Error during FirestoreService.getAll: $error');
    }

    return result;
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

    if (newData.containsKey('name')) {
      newData['nameKeywords'] = Utilities.keywordsGenerator(newData['name']);
    }
    await col.add(newData);
  }

  static Future<void> updateDoc(Collections colEnum, String docId,
      Map<String, dynamic> updatedData) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    if (updatedData.containsKey('name')) {
      updatedData['nameKeywords'] =
          Utilities.keywordsGenerator(updatedData['name']);
    }

    await col.doc(docId).update(updatedData);
  }

  static Future<void> deleteDoc(Collections colEnum, String docId) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);

    await col.doc(docId).delete();
  }

  static Future<List<dynamic>> getAllByNameSearch(
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

    final result = Utilities.getAllModels(colEnum, colDocs);

    try {
      print('FirestoreService.getAllBySearchTerm ($colName): ' + searchTerm);
      for (dynamic document in result) {
        print(document);
      }
    } catch (error) {
      print('Error during FirestoreService.getAllBySearchTerm: $error');
    }

    return result;
  }
}
