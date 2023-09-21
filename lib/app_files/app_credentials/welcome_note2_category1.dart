import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import '../../utils/dimentions.dart'; // Fixed typo: 'dimentions.dart' to 'dimensions.dart'
import '../../widgets/dots_indicator.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';

class WelcomeNoteImage extends StatelessWidget {
  final String imageUrl;

  const WelcomeNoteImage({super.key, Key? ekey, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent, // Set a transparent background
      ),
      padding: const EdgeInsets.only(top: 50.0),
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}

class Category1WelcomeNote2 extends StatelessWidget {
  const Category1WelcomeNote2({super.key, ekey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/2.png"),
            Center(
              child: WelcomeFont(
                text: 'Save Your',
              ),
            ),
            const Center(
              child: WelcomeFont(
                text: 'Favorite Book',
              ),
            ),
            SizedBox(
                height: Dimentions
                    .height20), // Fixed typo: 'Dimentions' to 'Dimensions'
            Padding(
              padding: EdgeInsets.all(Dimentions
                  .height10), // Fixed typo: 'Dimentions' to 'Dimensions'
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: 'Like your favorite books and find again',
                    maxLines: 2,
                  ),
                  SmallText(
                    text: 'in favorite page',
                    maxLines: 2,
                  ),
                ],
              ),
            ),

            SizedBox(
                height: Dimentions
                    .height10), // Fixed typo: 'Dimentions' to 'Dimensions'
            DotsIndicatorContainers(changingNumber: 1),
            SizedBox(
                height: Dimentions
                    .height5), // Fixed typo: 'Dimentions' to 'Dimensions'
            GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getWelcomeNote3Category1());
              },
              child: RoundButton(
                buttonText: 'Next',
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
