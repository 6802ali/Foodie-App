import 'package:flutter/material.dart';
import 'HomeWidgets/TopBar.dart';
import 'HomeWidgets/SearchBar.dart';
import 'HomeWidgets/offer_list.dart';
import 'HomeWidgets/MealSuggestionsText.dart';
import 'HomeWidgets/RestaurantsSuggestions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Color(0xFFF6F6F6)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: Column(
              children: [
                TopBar(),
                SearchBarr(),
                OfferList(),
                OffersListNav(),
                MealSuggestionsText(),
                MealSuggestionsList(),
                RestaurantsSuggestionsText(),
                RestaurantsSuggestionsList()
              ],
            )));
  }
}
