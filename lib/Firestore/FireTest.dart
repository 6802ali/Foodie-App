import 'package:foodie/Firestore/Models/Meal.dart';
import 'package:foodie/Firestore/Models/Restaurant.dart';
import 'package:foodie/Firestore/Services/MealService.dart';
import 'package:foodie/Firestore/Services/RestaurantService.dart';

class FireTest {
  static void getAllRestaurantTest() async {
    print('RestaurantService.getAll:');
    try {
      final allRestaurants = await RestaurantService.getAll();
      for (Restaurant res in allRestaurants) {
        print(res);
      }
    } catch (e) {
      print(e);
    }
  }

  static void addRestaurantTest() async {
    final restaurantTest = Restaurant(
      id: 'id',
      name: 'Hardees',
      location: 'Cairo',
      meals_id: [],
      reservations_id: [],
      reviews_id: [],
    );

    print('RestaurantService.addRestaurant:');
    try {
      RestaurantService.addRestaurant(restaurantTest);
    } catch (e) {
      print(e);
    }
  }

  static void addMealTest() async {
    final list = [
      Meal(
        id: 'id',
        description:
            'Our Spicy Tender Wrap starts with our premium all-white chicken hand dipped in buttermilk, lightly breaded and fried to a perfectly golden brown. We top it with our special spicy blend seasoning, pickles, mayonnaise lettuce, and shredded cheese, all served in a warm flour tortilla.',
        name: 'Spicy Tender Wrap',
        price: 120,
        restaurant_id: 'YteVfXVdLcxf3R3bdc00',
      ),
      Meal(
        id: 'id',
        description:
            'Two Quarter Pound 100% Angus beef patties, topped with two slices of melted American cheese, lettuce, tomatoes, sliced onions, dill pickles, Special Sauce, and mayonnaise on a toasted potato bun',
        name: 'Super Star',
        price: 140,
        restaurant_id: 'YteVfXVdLcxf3R3bdc00',
      ),
      Meal(
        id: 'id',
        description:
            'The Honey Mustard Tender Wrap starts with our premium all-white chicken hand dipped in buttermilk, lightly breaded and fried to a perfectly golden brown. We top it all off with lettuce, shredded cheese and our creamy honey mustard sauce, all served in a warm flour tortilla',
        name: 'Honey Mustard Tender Wrap',
        price: 115,
        restaurant_id: 'YteVfXVdLcxf3R3bdc00',
      ),
      Meal(
        id: 'id',
        description:
            'Quarter Pound 100% Angus beef patty, topped with crispy bacon, melted Swiss cheese, tomatoes, and mayonnaise, served on toasted sourdough',
        name: 'Frisco Burger',
        price: 120,
        restaurant_id: 'YteVfXVdLcxf3R3bdc00',
      ),
    ];

    print('MealService.addMeal:');
    try {
      for (Meal meal in list) MealService.addMeal(meal);
    } catch (e) {
      print(e);
    }
  }
}
