import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Reservation.dart';

class ReservationService {
  static Future<List<Reservation>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allReservationDocs =
        await FirestoreService.getAll(Collections.reservation);
    final List<Reservation> allReservationModels =
        Reservation.serviceDocumentListConvertor(allReservationDocs);

    return allReservationModels;
  }

  static Future<Reservation> getReservationById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> reservationDoc =
        await FirestoreService.getDocumentById(
            Collections.reservation, documentId);
    final Reservation reservationModel =
        Reservation.serviceDocumentConvertor(reservationDoc);

    return reservationModel;
  }

  static Future<List<Reservation>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<Reservation> documentsList = [];

    for (String documentId in documentIds) {
      Reservation documentSnapshot = await getReservationById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addReservation(Reservation reservation) {
    FirestoreService.addDoc(
      Collections.reservation,
      Reservation.serviceConstructor(reservation),
    );
  }

  static void updateReservation(Reservation reservation, String reservationId) {
    FirestoreService.updateDoc(
      Collections.reservation,
      reservationId,
      Reservation.serviceConstructor(reservation),
    );
  }

  static void deleteReservation(String reservationId) {
    FirestoreService.deleteDoc(
      Collections.reservation,
      reservationId,
    );
  }
}
