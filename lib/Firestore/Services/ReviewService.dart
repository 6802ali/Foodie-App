import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Review.dart';

class ReviewService {
  static Future<List<Review>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allReviewDocs =
        await FirestoreService.getAll(Collections.review);
    final List<Review> allReviewModels =
        Review.serviceDocumentListConvertor(allReviewDocs);

    return allReviewModels;
  }

  static Future<Review> getReviewById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> reviewDoc =
        await FirestoreService.getDocumentById(Collections.review, documentId);
    final Review reviewModel = Review.serviceDocumentConvertor(reviewDoc);

    return reviewModel;
  }

  static Future<List<Review>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<Review> documentsList = [];

    for (String documentId in documentIds) {
      Review documentSnapshot = await getReviewById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addReview(Review review) {
    FirestoreService.addDoc(
      Collections.review,
      Review.serviceConstructor(review),
    );
  }

  static void updateReview(Review review, String reviewId) {
    FirestoreService.updateDoc(
      Collections.review,
      reviewId,
      Review.serviceConstructor(review),
    );
  }

  static void deleteReview(String reviewId) {
    FirestoreService.deleteDoc(
      Collections.review,
      reviewId,
    );
  }
}
