import 'package:flutter/material.dart';
import 'package:flutter_application_1/reservation/widgets/category_item.dart';

// ignore: camel_case_types

// ignore: camel_case_types
class Categories extends StatelessWidget {
  Categories({super.key, required this.categoryname});
  final List<String> categoryname;
  List<Widget> allCategories = [];

  @override
  Widget build(BuildContext context) {
    for (String category in this.categoryname) {
      allCategories.add(CategoryItem(category: category));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: allCategories,
      ),
    );
  }
}
