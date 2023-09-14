import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../utils/dimentions.dart';

class RoundButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor, fontColor, borderColor;
  final double buttonWidth, buttonHeight;

  RoundButton({
    required this.buttonText,
    this.buttonColor = const Color(0xff356B07),
    this.fontColor = const Color(0xffFFFFFF),
    this.borderColor = const Color(0xff356B07),
    this.buttonWidth = 100,
    this.buttonHeight = 50,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth == 100 ? Dimentions.width100 : buttonWidth,
      height: buttonHeight == 50 ? Dimentions.height50 : buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimentions.radius20),
        color: buttonColor,
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: SmallText(
          text: buttonText,
          fontColor: fontColor,
          fontSize: Dimentions.font20,
        ),
      ),
    );
  }
}
