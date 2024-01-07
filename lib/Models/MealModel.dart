class MealModel {
  final String mealName;
  final String mealDescription;
  final String mealPrice;

  MealModel({
    required this.mealName,
    required this.mealDescription,
    required this.mealPrice,
  });

  factory MealModel.fromJson(Map<String, dynamic>? json) {
    return MealModel(
      mealName: json?['meal_name'] ?? '',
      mealDescription: json?['meal_description'] ?? '',
      mealPrice: json?['meal_price'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MealModel{mealName: $mealName, mealDescription: $mealDescription, mealPrice: $mealPrice}';
  }
}