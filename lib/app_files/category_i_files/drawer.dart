import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../widgets/rounded_button.dart';

class SlidDrawer extends StatelessWidget {
  const SlidDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.BASE_COLOR),
            accountName: const TextHeader(text: 'W.D.Fernando'),
            accountEmail: TextHeader(
              text: 'wdfernando@students.nsbm.ac.lk',
              fontSize: Dimentions.font12,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "asset/profile/default.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(FormIntegrator.getProfile(1));
            },
            leading: const Icon(Icons.supervised_user_circle),
            title: buttonPanes(text: 'User Profile'),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(FormIntegrator.getBookCategories());
            },
            leading: const Icon(Icons.library_books),
            title: buttonPanes(text: 'Book categories'),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(FormIntegrator.getNotification());
            },
            leading: const Icon(Icons.notifications),
            title: buttonPanes(text: 'Notification'),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(FormIntegrator.getFavouriteBooks());
            },
            leading: const Icon(Icons.favorite),
            title: buttonPanes(text: 'Favourite'),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(FormIntegrator.getUserSettings());
            },
            leading: const Icon(Icons.settings),
            title: buttonPanes(text: 'Settings'),
          ),
          SizedBox(height: Dimentions.height50),
          Padding(
            padding: EdgeInsets.all(Dimentions.height50),
            child: GestureDetector(
              onTap: () {
                DialogBox warningDialog = DialogBox(
                    context: context,
                    title: "Sign Out",
                    description:
                        "Are you sure to sign out? because sign out may delete all the proper data implications that are finished halfly.",
                    onPressed: () {
                      Get.toNamed(FormIntegrator.getSignIn());
                    });
                warningDialog.warningDialogBox();
              },
              child: const RoundButton(
                buttonText: 'LogOut',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonPanes({
    required String text,
  }) {
    return TextHeader(
      text: text,
      fontColor: AppColors.NORMAL_TEXT_COLOR,
      fontSize: Dimentions.font20,
    );
  }
}
