import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const  CategoryItem({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 116, 115, 115),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          category,
          style: const TextStyle(fontSize: 20),
        ));
  }
}
