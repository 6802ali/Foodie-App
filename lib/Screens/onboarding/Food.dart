import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../Loginpage.dart';

class Food extends StatelessWidget {
  final PageController controller;

  Food({required this.controller});

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
                      'assets/images/Safe Food.svg',
                      width: 200.0,
                      height: 200.0,
                    ),
                    const SizedBox(height: 50.0),
                    const Text(
                      'Good food at a cheap price',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      width: 290.0,
                      child: const Text(
                        'You can eat at expensive restaurants with affordable prices',
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
                  //       // MaterialPageRoute(builder: (context) => LoginPage(title: 'Login',controller: controller)),
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
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       // MaterialPageRoute(builder: (context) => LoginPage(title: 'Login',controller: controller)),
                  //     // );
                  //   },
                  //   icon: const Icon(Icons.arrow_forward),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
