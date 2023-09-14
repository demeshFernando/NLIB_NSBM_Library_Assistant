import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/dimentions.dart';

class WelcomeNoteImage extends StatelessWidget {
  final String imageUrl;
  final double containerWidth, containerHeight;
  bool isPaddingRequired;

  WelcomeNoteImage({
    required this.imageUrl,
    this.containerHeight = 300,
    this.containerWidth = 300,
    this.isPaddingRequired = true,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPaddingRequired
          ? EdgeInsets.only(top: Dimentions.height100, left: Dimentions.width10)
          : EdgeInsets.zero,
      width: containerWidth == 300 ? Dimentions.width300 : containerWidth,
      height: containerHeight == 300 ? Dimentions.height300 : containerHeight,
      color: AppColors.CONTAINER_WHITE,
      child: imageUrl == ""
          ? Container(color: AppColors.BASE_COLOR)
          : Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
    );
  }
}
