import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../form_integration/form_integrater.dart';
import '../../utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../widgets/dots_indicator.dart';
import '../../widgets/images.dart';
import '../../widgets/rounded_button.dart';

class Category1WelcomeNote1 extends StatelessWidget {
  const Category1WelcomeNote1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/1.png"),
            SizedBox(height: Dimentions.height25),
            Center(
              child: WelcomeFont(
                text: 'Search Library',
              ),
            ),
            Center(
              child: WelcomeFont(
                text: 'Book Online',
              ),
            ),
            SizedBox(height: Dimentions.height25),
            Padding(
              padding: EdgeInsets.all(Dimentions.height5),
              child: Center(
                child: SmallText(
                  text:
                      'you dont need to search to books \nin racks any more just search here!',
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(height: Dimentions.height30),
            // Add spacing between text and button
            DotsIndicatorContainers(changingNumber: 0),

            SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Get.toNamed(FormIntegrator.getWelcomeNote2Category1());
                },
                child: RoundButton(
                    buttonText: 'Next', buttonWidth: Dimentions.width200)),
          ],
        ),
      ),
    );
  }
}
