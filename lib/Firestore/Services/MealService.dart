import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Meal.dart';

class MealService {
  static Future<List<Meal>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allMealDocs =
        await FirestoreService.getAll(Collections.meal);
    final List<Meal> allMealModels =
        Meal.serviceDocumentListConvertor(allMealDocs);

    return allMealModels;
  }

  static Future<Meal> getMealById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> mealDoc =
        await FirestoreService.getDocumentById(Collections.meal, documentId);
    final Meal mealModel = Meal.serviceDocumentConvertor(mealDoc);

    return mealModel;
  }

  static Future<List<Meal>> getAllByIds(
    List<dynamic> documentIds,
  ) async {
    List<Meal> documentsList = [];

    for (String documentId in documentIds) {
      Meal documentSnapshot = await getMealById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addMeal(Meal meal) {
    FirestoreService.addDoc(
      Collections.meal,
      Meal.serviceConstructor(meal),
    );
  }

  static void updateMeal(Meal meal, String mealId) {
    FirestoreService.updateDoc(
      Collections.meal,
      mealId,
      Meal.serviceConstructor(meal),
    );
  }

  static void deleteMeal(String mealId) {
    FirestoreService.deleteDoc(
      Collections.meal,
      mealId,
    );
  }
}
