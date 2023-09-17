import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/images.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class PasswordResetGuideliness extends StatelessWidget {
  const PasswordResetGuideliness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.BASE_COLOR,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.ICON_WHITE,
          ),
        ),
        title: const TextHeader(text: 'Reset Credentials'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimentions.height5),
            WelcomeNoteImage(
              imageUrl: "asset/signin_images/reset_guildelines/1.jpg",
              isPaddingRequired: false,
              containerWidth: double.infinity,
            ),
            headingWidget('Introduction to Username'),
            UnderlineContainer(),
            bodyContainer(
              'one of the basic credential we are checking here is the Username for sign in. in here the user can enter his/her email address which was reserved by the university to use as the email related with outlook or his/her index number which is also a group of integer characters. both are accetable for this application.',
            ),
            SizedBox(height: Dimentions.height5),
            WelcomeNoteImage(
              imageUrl: "asset/signin_images/reset_guildelines/2.jpg",
              isPaddingRequired: false,
              containerWidth: double.infinity,
            ),
            headingWidget('Introduction to password'),
            UnderlineContainer(),
            bodyContainer(
                'password is the next credential checkup we used to identify the user. this password not anyother character that you have to create, it is provided by the NSBM green university. For many verifications that happened inside the university since this application is only applicable inside the university that password is able to access the application.'),
            SizedBox(height: Dimentions.height5),
            WelcomeNoteImage(
              imageUrl: "asset/signin_images/reset_guildelines/3.jpg",
              isPaddingRequired: false,
              containerWidth: double.infinity,
            ),
            headingWidget('Resetting both username and password'),
            UnderlineContainer(),
            bodyContainer(
              'since the username and the password is created by the university itself for you since you registered to the university, the application itself does not have permission to reset the username or password. which reserved for you. If you believe that your password is leaked you can lock the application by visiting to the library or sending a mail to the library staff. Even you can get library details using the application though the mail does not fix any thing instantly it will be a proof to say that from now onward the actions you are doing using the application is not authorized by you.',
            ),
            const SizedBox(
              width: double.maxFinite,
              child: Center(child: BoldText(text: 'Thank you!')),
            ),
            const SizedBox(
              width: double.maxFinite,
              child: Center(child: SmallText(text: 'Use the product wisely.')),
            )
          ],
        ),
      ),
    );
  }

  Widget headingWidget(String text) {
    return Container(
      padding: EdgeInsets.all(Dimentions.height10),
      child: TextHeader(
        text: text,
        fontColor: AppColors.NORMAL_TEXT_COLOR,
        maxLines: 2,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UnderlineContainer() {
    return Row(
      children: [
        SizedBox(width: Dimentions.width100),
        Container(
          height: Dimentions.height5,
          width: Dimentions.width250,
          color: AppColors.CONTAINER_COLOR,
        )
      ],
    );
  }

  Widget bodyContainer(String text) {
    return Container(
      padding: EdgeInsets.all(Dimentions.height10),
      child: SmallText(text: text, maxLines: 100),
    );
  }
}
