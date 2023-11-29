import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: double.infinity,
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Center(child: Image.asset('assets/sidebarIcon.png')),
          ),
          const SizedBox(width: 38),
          Container(
            width: 199,
            height: double.infinity,
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  child: Center(child: Image.asset('assets/locIcon.png')),
                ),
                const SizedBox(width: 10),
                Text(
                  'Agrabad 435, Chittagong',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.19,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 38),
          Container(
            width: 52,
            height: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Center(
                  child: Image.asset('assets/profilePicPlaceholder.png')),
            ),
          ),
        ],
      ),
    );
  }
}
