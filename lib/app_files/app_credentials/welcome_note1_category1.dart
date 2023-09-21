import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../form_integration/form_integrater.dart'; // Fixed typo: 'dimentions.dart' to 'dimensions.dart'
import 'package:nlib_library_assistant/widgets/text_formatter.dart';
import '../../utils/dimentions.dart';
import '../../widgets/dots_indicator.dart';
import '../../widgets/rounded_button.dart';

class WelcomeNoteImage extends StatelessWidget {
  final String imageUrl;

  const WelcomeNoteImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent, // Setted a transparent background
      ),
      padding: EdgeInsets.only(top: Dimentions.heigght60),
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}

class Category1WelcomeNote1 extends StatelessWidget {
  late double screenHight;
  Category1WelcomeNote1({
    super.key,
  });

  @override
  void initState() {
    screenHight = Get.context!.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeNoteImage(
                imageUrl: "./asset/welcome_images/category_i/1.png"),
            const Center(
              child: WelcomeFont(
                text: 'Search Library',
              ),
            ),
            const Center(
              child: WelcomeFont(
                text: 'Book Online',
              ),
            ),
            SizedBox(height: Dimentions.heigght25),
            Padding(
              padding: EdgeInsets.all(Dimentions.heigght5),
              child: const Center(
                child: SmallText(
                  text:
                      'You don\'t need to search for books \nin racks anymore, just search here!',
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(height: Dimentions.heigght10),
            const DotsIndicatorContainers(changingNumber: 0),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getWelcomeNote2Category1());
              },
              child: RoundButton(
                  buttonText: 'Next', buttonWidth: Dimentions.widdth200),
            ),
          ],
        ),
      ),
    );
  }
}
