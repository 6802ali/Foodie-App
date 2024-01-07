import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie/Firestore/FirestoreService.dart';
import 'package:foodie/Firestore/Models/Restaurant.dart';

class RestaurantService {
  static Future<List<Restaurant>> getAll() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allRestaurantDocs =
        await FirestoreService.getAll(Collections.restaurant);
    final List<Restaurant> allRestaurantModels =
        Restaurant.serviceDocumentListConvertor(allRestaurantDocs);

    return allRestaurantModels;
  }
  
  static Future<List<Restaurant>> getAllByNameSearch(String searchTerm) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> allRestaurantDocs =
        await FirestoreService.getAllByNameSearch(Collections.restaurant, searchTerm);
    final List<Restaurant> allRestaurantModels =
        Restaurant.serviceDocumentListConvertor(allRestaurantDocs);

    return allRestaurantModels;
  }


  static Future<Restaurant> getRestaurantById(
    String documentId,
  ) async {
    final DocumentSnapshot<Map<String, dynamic>> restaurantDoc =
        await FirestoreService.getDocumentById(Collections.restaurant, documentId);
    final Restaurant restaurantModel = Restaurant.serviceDocumentConvertor(restaurantDoc);

    return restaurantModel;
  }

  static Future<List<Restaurant>> getAllByIds(
    List<String> documentIds,
  ) async {
    List<Restaurant> documentsList = [];

    for (String documentId in documentIds) {
      Restaurant documentSnapshot = await getRestaurantById(documentId);
      documentsList.add(documentSnapshot);
    }

    return documentsList;
  }

  static void addRestaurant(Restaurant restaurant) {
    FirestoreService.addDoc(
      Collections.restaurant,
      Restaurant.serviceConstructor(restaurant),
    );
  }

  static void updateRestaurant(Restaurant restaurant, String restaurantId) {
    FirestoreService.updateDoc(
      Collections.restaurant,
      restaurantId,
      Restaurant.serviceConstructor(restaurant),
    );
  }

  static void deleteRestaurant(String restaurantId) {
    FirestoreService.deleteDoc(
      Collections.restaurant,
      restaurantId,
    );
  }
}
