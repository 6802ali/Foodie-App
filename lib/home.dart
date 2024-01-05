import 'package:flutter/material.dart';
import 'HomeWidgets/Navtabs.dart';
import 'HomeWidgets/TopBar.dart';
import 'HomeWidgets/SearchBar.dart';
import 'HomeWidgets/offer_list.dart';
import 'HomeWidgets/MealSuggestionsText.dart';
import 'HomeWidgets/RestaurantsSuggestions.dart';
// import 'SearchWidgets/Search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: const Column(
                  children: [
                    OfferList(),
                    OffersListNav(),
                    MealSuggestionsText(),
                    MealSuggestionsList(),
                    RestaurantsSuggestionsText(),
                    RestaurantsSuggestionsList(),
                    RestaurantsSuggestionsList(),
                  ],
                ),
              ),
            ),
          ),
          // Navtabs()
        ],
      ),
    );

    // return SafeArea(
    //   child: Scaffold(
    //       body: Center(
    //     child: SingleChildScrollView(
    //       child: Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(16.0),
    //         color: Colors.grey[200],
    //         child: Column(
    //           children: [
    //             OfferList(),
    //             OffersListNav(),
    //             MealSuggestionsText(),
    //             MealSuggestionsList(),
    //             RestaurantsSuggestionsText(),
    //             RestaurantsSuggestionsList(),
    //             RestaurantsSuggestionsList(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   )
    //       // ],
    //       ),
    // );
  }
}
