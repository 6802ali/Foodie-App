import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeWidgets/Navtabs.dart';
import 'package:flutter_application_1/HomeWidgets/RestaurantsSuggestions.dart';
import 'package:flutter_application_1/HomeWidgets/SearchBar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            child: SearchBarr(),
          ),
          RestaurantsSuggestionsList(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
          ),
          Navtabs(),
        ],
      ),
    );
  }
}
