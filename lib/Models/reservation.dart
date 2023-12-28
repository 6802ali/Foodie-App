
//deprecated
// import 'package:foodie/Firestore/Models/User.dart';
// import 'package:foodie/Models/RestaurantModel.dart';
// import 'package:foodie/Models/menu.dart';
// import 'package:foodie/firebase/Users.dart';

// class ResetvationModel {
//   final RestaurantModel restaurant;
//   final User user;
//   final String id;
//   ResetvationModel({
//     required this.restaurant,
//     required this.user,
//     required this.id,
//   });

//   static Future toMap(Map<String, dynamic> json) async {
//     return ResetvationModel(
//         id: json['id'] ?? 0,
//         user: await Firetest.getbyid(json['user']!),
//         restaurant: RestaurantModel(
//             //get restaurant by id
//             id: 0,
//             location: "location",
//             menu: MenuModel(menuName: "menuName", meals: []),
//             rating: 0.0,
//             restaurantName: "restaurantName",
//             tables: 3,
//             field: "field",
//             restaurant_img_link: "restaurant_img_link"));
//   }
// }
// final int id;
//   final String location;
//   final MenuModel menu;
//   final double rating;
//   final String restaurantName;
//   final int tables;
//   final String field;
//   final String restaurant_img_link;
