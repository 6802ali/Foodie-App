import 'package:flutter/material.dart';
// import 'package:foodie/Loginpage.dart';
import 'package:foodie/Screens/onboarding/Food.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'nearby.dart'; // Update import statement

final _controller = PageController();

class Select extends StatelessWidget {
  final PageController controller;

  const Select({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Order illustration.svg',
                      width: 200.0,
                      height: 200.0,
                    ),
                    const SizedBox(height: 50.0),
                    const Text(
                      'Select the Favorites Menu',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      width: 290.0,
                      child: const Text(
                        'Now eat well, dont leave the house,You can choose your favorite food only with one click',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (context) => LoginPage(title: 'Login',controller: controller)),
                  //     );
                  //   },
                  //   child: const Text('Skip'),
                  // ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const SwapEffect(
                      activeDotColor: Colors.green,
                      dotColor: Colors.grey,
                      dotHeight: 20,
                      dotWidth: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Food(controller: controller)),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
