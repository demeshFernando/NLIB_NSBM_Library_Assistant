import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:nlib_library_assistant/form_integration/form_integrater.dart";
import 'package:nlib_library_assistant/utils/dimentions.dart';

import '../../widgets/dots_indicator.dart';
import '../../widgets/images.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';

class Category1WelcomeNote3 extends StatelessWidget {
  const Category1WelcomeNote3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/3.png"),
            SizedBox(height: Dimentions.height25),
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
            SizedBox(height: Dimentions.height25),
            Padding(
              padding: EdgeInsets.all(Dimentions.height5),
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
            SizedBox(height: Dimentions.height30),
            // Add spacing between text and button
            const DotsIndicatorContainers(changingNumber: 2),

            SizedBox(height: Dimentions.height30),
            GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getDashboard());
              },
              child: RoundButton(
                  buttonText: 'Start Using', buttonWidth: Dimentions.width200),
            ),
          ],
        ),
      ),
    );
  }
}
