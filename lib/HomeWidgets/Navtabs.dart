import 'package:flutter/material.dart';
import 'package:flutter_application_1/SearchWidgets/Search.dart';

class Navtabs extends StatelessWidget {
  const Navtabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to the second page when the container is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset('assets/homeicon.png'),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Text(
                        'Home',
                        style: TextStyle(
                            color: Color(0xFF4B5563),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.4),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        'assets/searchIcon.png',
                        scale: 0.5,
                        color: Color.fromARGB(255, 48, 48, 48),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      'Search',
                      style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.4),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.asset('assets/profileicon.png'),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.4),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
