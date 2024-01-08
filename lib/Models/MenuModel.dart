import 'package:foodie/Models/MealModel.dart';

class MenuModel {
  final List<MealModel> meals;

  MenuModel({
    required this.meals,
  });

  factory MenuModel.fromJson(Map<String, dynamic>? json) {
    return MenuModel(
      meals: (json?['meals'] as List?)
        ?.whereType<Map<String, dynamic>>() // Filter out nulls and non-Map items
        .map<MealModel>((meal) => MealModel.fromJson(meal))
        .toList() ?? [],
    );
  }

  @override
  String toString() {
    return 'MenuModel{meals: $meals}';
  }
}
