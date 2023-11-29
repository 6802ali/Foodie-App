import 'package:flutter/material.dart';

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 571,
        height: 164,
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/placeholderOffer1.png'),
            const SizedBox(
              width: 11,
            ),
            Image.asset('assets/placeholderOffer2.png'),
          ],
        ),
      ),
    );
  }
}

class OffersListNav extends StatelessWidget {
  const OffersListNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/ellipse_green.png'),
          const SizedBox(width: 4),
          Image.asset('assets/ellipse_grey.png'),
          const SizedBox(width: 4),
          Image.asset('assets/ellipse_grey.png'),
        ],
      ),
    );
  }
}
