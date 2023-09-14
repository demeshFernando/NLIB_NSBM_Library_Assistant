import 'package:flutter/material.dart';

import '../utils/dimentions.dart';

class DotsIndicatorContainers extends StatelessWidget {
  final int changingNumber;
  final Color activeDotColor, normalDotColor;

  DotsIndicatorContainers({
    required this.changingNumber,
    this.activeDotColor = const Color(0xff8dc63f),
    this.normalDotColor = const Color(0xff868889),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimentions.width150,
      height: Dimentions.height100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          changingNumber == 0 ? activeDotContainer() : inactiveDotContainer(),
          changingNumber == 1 ? activeDotContainer() : inactiveDotContainer(),
          changingNumber == 2 ? activeDotContainer() : inactiveDotContainer(),
        ],
      ),
    );
  }

  Widget activeDotContainer() {
    return Container(
      width: Dimentions.width50,
      height: Dimentions.height10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimentions.radius10),
        color: activeDotColor,
      ),
    );
  }

  Widget inactiveDotContainer() {
    return Container(
      width: Dimentions.width10,
      height: Dimentions.height10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: normalDotColor,
      ),
    );
  }
}
