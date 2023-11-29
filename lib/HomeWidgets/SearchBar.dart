import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 51,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          width: 280,
          height: 46,
          decoration: ShapeDecoration(
            color: Color(0xFFE6E7E9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 145,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/searchIcon.png'),
                    const SizedBox(width: 19),
                    Text(
                      'Search',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.19,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
