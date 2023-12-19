import 'menu.dart';

//ignore: file_names
class RestaurantModel {
  final int id;
  final String location;
  final MenuModel menu;
  final double rating;
  final String restaurantName;
  final int tables;
  final String field;

  RestaurantModel({
    required this.id,
    required this.location,
    required this.menu,
    required this.rating,
    required this.restaurantName,
    required this.tables,
    required this.field
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? 0,
      location: json['location'] ?? '',
      menu: MenuModel.fromJson(json['menu'] ?? {}),
      rating: json['rating'] ?? 0.0,
      restaurantName: json['restaurant_name'] ?? '',
      tables: json['tables'] ?? 0,
      field: json['field']
    );
  }

  // toString method
  @override
  String toString() {
    return 'RestaurantModel{id: $id, location: $location, menu: $menu, rating: $rating, restaurantName: $restaurantName, tables: $tables}';
  }
}