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
          buttonPanes(
              tileIndex: 0,
              text: 'User Profile',
              icon: const Icon(Icons.supervised_user_circle)),
          buttonPanes(
              tileIndex: 1,
              text: 'Borrowed Books',
              icon: const Icon(Icons.library_books)),
          buttonPanes(
              tileIndex: 2,
              text: 'Notification',
              icon: const Icon(Icons.notifications)),
          buttonPanes(
              tileIndex: 3,
              text: 'Favourite',
              icon: const Icon(Icons.favorite)),
          buttonPanes(
              tileIndex: 4, text: 'Settings', icon: const Icon(Icons.settings)),
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
    required Icon icon,
    required int tileIndex,
  }) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: () {
        //if button index = 0
        if (tileIndex == 0) {
          Get.toNamed(FormIntegrator.getProfile(1));
        }

        //if button index = 1
        else if (tileIndex == 1) {
          Get.toNamed(FormIntegrator.getBookCategories());
        }

        //if button index = 2
        else if (tileIndex == 2) {
          Get.toNamed(FormIntegrator.getNotification());
        }

        //if button index = 3
        else if (tileIndex == 3) {
          Get.toNamed(FormIntegrator.getFavouriteBooks());
        }

        //if button index = 4
        else if (tileIndex == 4) {
          Get.toNamed(FormIntegrator.getUserSettings());
        }
      },
    );
  }
}
