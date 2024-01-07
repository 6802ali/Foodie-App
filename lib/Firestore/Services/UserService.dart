import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/User.dart';

class UserService {
  static Future<List<User>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allUserDocs =
        await FirestoreService.getAll(Collections.user);
    final List<User> allUserModels =
        User.serviceDocumentListConvertor(allUserDocs);

    return allUserModels;
  }

  static Future<User> getUserById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FirestoreService.getDocumentById(Collections.user, documentId);
    final User userModel = User.serviceDocumentConvertor(userDoc);

    return userModel;
  }

  static Future<List<User>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<User> documentsList = [];

    for (String documentId in documentIds) {
      User documentSnapshot = await getUserById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addUser(User user, String userId) {
    FirestoreService.addDocWithId(
      Collections.user,
      User.serviceConstructor(user),
      userId,
    );
  }

  static void updateUser(User user, String userId) {
    FirestoreService.updateDoc(
      Collections.user,
      userId,
      User.serviceConstructor(user),
    );
  }

  static void deleteUser(String userId) {
    FirestoreService.deleteDoc(
      Collections.user,
      userId,
    );
  }
}
