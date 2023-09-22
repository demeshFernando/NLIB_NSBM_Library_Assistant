import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart'; // Fixed typo: 'dimentions.dart' to 'dimensions.dart'

import '../../widgets/dots_indicator.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';

class WelcomeNoteImage extends StatelessWidget {
  final String imageUrl;

  const WelcomeNoteImage({super.key, Key? threeekey, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Set a transparent background
      padding: EdgeInsets.only(
          top: Dimentions.heigght100, left: Dimentions.widdth40),
      child: Center(
        child: Image.asset(
          imageUrl,
        ),
      ),
    );
  }
}

class Category1WelcomeNote3 extends StatelessWidget {
  const Category1WelcomeNote3({super.key, Key? threekey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/3.png"),
            SizedBox(
                height: Dimentions
                    .heigght25), // Fixed typo: 'Dimentions' to 'Dimensions'
            const Center(
              child: WelcomeFont(
                text: 'Allocate a study',
              ),
            ),
            const Center(
              child: WelcomeFont(
                text: 'room online',
              ),
            ),
            SizedBox(
                height: Dimentions
                    .heigght25), // Fixed typo: 'Dimentions' to 'Dimensions'
            Padding(
              padding: EdgeInsets.all(Dimentions
                  .heigght5), // Fixed typo: 'Dimentions' to 'Dimensions'
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: 'Now you can allocate a study room via',
                    maxLines: 2,
                  ),
                  SmallText(
                    text: 'NLib App',
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
                height: Dimentions
                    .heigght30), // Fixed typo: 'Dimentions' to 'Dimensions'
            // Add spacing between text and button
            const DotsIndicatorContainers(changingNumber: 2),

            SizedBox(
                height: Dimentions
                    .heigght50), // Fixed typo: 'Dimentions' to 'Dimensions'
            GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getDashboard());
              },
              child: RoundButton(
                buttonText: 'Start Using',
                buttonWidth: Dimentions
                    .width200, // Fixed typo: 'Dimentions' to 'Dimensions'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
