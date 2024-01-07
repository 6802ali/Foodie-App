import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage(String chatId, String text) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('chat/$chatId/messages').add({
        'userId': user.uid,
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getMessagesStream(
      String chatId) {
    final Stream<DocumentSnapshot<Map<String, dynamic>>> messages =
        _firestore.collection('chat').doc(chatId).snapshots();

    /* messages.listen((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      print(snapshot.data());
    }); */

    return messages;
  }
}
