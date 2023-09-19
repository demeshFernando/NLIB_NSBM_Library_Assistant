import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';

import '../../utils/dimentions.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/images.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';

class Category1WelcomeNote2 extends StatelessWidget {
  const Category1WelcomeNote2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/2.png"),
            SizedBox(height: Dimentions.height25),
            const Center(
              child: WelcomeFont(
                text: 'Save Your',
              ),
            ),
            const Center(
              child: WelcomeFont(
                text: 'Favorite Book',
              ),
            ),
            SizedBox(height: Dimentions.height25),
            Padding(
              padding: EdgeInsets.all(Dimentions.height5),
              child: const Column(
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
            SizedBox(height: Dimentions.height30),
            // Add spacing between text and button
            const DotsIndicatorContainers(changingNumber: 1),

            SizedBox(height: Dimentions.height30),
            GestureDetector(
                onTap: () {
                  Get.toNamed(FormIntegrator.getWelcomeNote3Category1());
                },
                child: RoundButton(
                    buttonText: 'Next', buttonWidth: Dimentions.width200)),
          ],
        ),
      ),
    );
  }
}
