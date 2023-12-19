import 'package:flutter_application_1/Models/meal.dart';

class MenuModel {
  final String menuName;
  final List<MealModel> meals;

  MenuModel({
    required this.menuName,
    required this.meals,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      menuName: json['menu_name'] ?? '',
      meals: json['meals'] != null
          ? (json['meals'] as List?)
              ?.where((meal) => meal != null)
              .map<MealModel>((meal) => MealModel.fromJson(meal as Map<String, dynamic>))
              .toList() ?? []
          : [],
    );
  }
}
