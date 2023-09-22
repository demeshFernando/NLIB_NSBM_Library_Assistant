import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/app_files/services/auth.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../utils/dimentions.dart';

class Profile extends StatefulWidget {
  final int pageId;
  const Profile({super.key, required this.pageId});

  @override
  // ignore: library_private_types_in_public_api
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {

  final AuthService _auth = AuthService();
  //default values for expansion tiles
  double containerPadding = Dimentions.height20,
      rowLeftPadding = Dimentions.width40,
      iconSize = Dimentions.icon18,
      titleFontSize = Dimentions.font14;
  Color iconColor = AppColors.ICON_WHITE;

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
              Icons.arrow_back,
              color: AppColors.ICON_WHITE,
            )),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: Dimentions.heigght150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimentions.radius20),
                    bottomRight: Radius.circular(Dimentions.radius20),
                  ),
                  color: AppColors.BASE_COLOR,
                ),
              ),
              Positioned(
                top: Dimentions.heigght80,
                child: CircleAvatar(
                  minRadius: Dimentions.radius80,
                  backgroundColor: AppColors.CONTAINER_WHITE,
                  child: CircleAvatar(
                    radius: Dimentions.radius70,
                    backgroundColor: AppColors.CONTAINER_WHITE,
                    child: ClipOval(
                      child: Image.asset(
                        "asset/profile/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Dimentions.heigght180,
                left: Dimentions.widdth220,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(Dimentions.heigght20),
                    child: CircleAvatar(
                      backgroundColor: AppColors.BUTTON_COLOR,
                      radius: Dimentions.radius20,
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.ICON_WHITE,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Dimentions.heigght240,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextHeader(
                        text: 'Olivia Austin',
                        fontColor: AppColors.NORMAL_TEXT_COLOR,
                      ),
                    ),
                    SizedBox(height: Dimentions.heigght5),
                    SmallText(
                      text: 'olivia@students.nsbm.ac.lk',
                      fontColor: AppColors.FADED_TEXT_COLOR,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimentions.heigght200),
          Column(
            children: [
              ExpansionTile(
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: containerPadding),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: rowLeftPadding),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: AppColors.BASE_COLOR,
                          size: iconSize,
                        ),
                      ),
                      SizedBox(width: Dimentions.width10),
                      BoldText(
                        text: 'About Me',
                        fontSize: titleFontSize,
                      ),
                    ],
                  ),
                ),
                children: const [
                  Center(
                    child: Column(
                      children: [
                        SmallText(text: 'Name: Olivia Austin'),
                        SmallText(text: 'Email: Olivia@students.nsbm.ac.lk'),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: Dimentions.heigght30),
                  buttonTiles(
                      icon: Icons.favorite,
                      titleText: 'My Favourite',
                      buttonIndex: 0),
                  SizedBox(height: Dimentions.heigght30),
                  buttonTiles(
                      icon: Icons.notifications_none,
                      titleText: 'Notification',
                      buttonIndex: 1,
                      isCountNotificationShowable: true,
                      notificationCount: '99'),
                  SizedBox(height: Dimentions.heigght30),
                  signOutTile(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonTiles(
      {required IconData icon,
      required String titleText,
      required int buttonIndex,
      bool isCountNotificationShowable = false,
      String notificationCount = "2"}) {
    return InkWell(
      onTap: () {
        if (buttonIndex == 0) {
          Get.toNamed(FormIntegrator.getFavouriteBooks());
        } else if (buttonIndex == 1) {
          Get.toNamed(FormIntegrator.getNotification());
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: containerPadding, vertical: Dimentions.heigght10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: rowLeftPadding),
                  child: Icon(
                    icon,
                    color: AppColors.BASE_COLOR,
                    size: iconSize,
                  ),
                ),
                SizedBox(width: Dimentions.width10),
                Padding(
                  padding: EdgeInsets.only(left: Dimentions.width2),
                  child: BoldText(
                    text: titleText,
                    fontSize: titleFontSize,
                  ),
                ),
              ],
            ),
            isCountNotificationShowable
                ? Row(
                    children: [
                      Container(
                        width: Dimentions.width30,
                        height: Dimentions.heigght30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.WARNING_TEXT_COLOR,
                        ),
                        child: Center(
                          child: BoldText(
                            text: notificationCount,
                            fontColor: AppColors.HEADER_TEXT_COLOR,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: Dimentions.width40),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: AppColors.GRAY_COLOR,
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(right: Dimentions.width40),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: iconSize,
                      color: AppColors.GRAY_COLOR,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget signOutTile() {
    return InkWell(
      onTap: () {
        DialogBox warningDialog = DialogBox(
            context: context,
            title: 'Sign Out',
            description:
                "Are you sure to sign out?",
            onPressed: () async {
                  await _auth.signOut();
                  Get.toNamed(FormIntegrator.signIn);
                },
            );
        warningDialog.warningDialogBox();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: containerPadding, vertical: Dimentions.heigght10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: rowLeftPadding),
                  child: Icon(
                    Icons.logout,
                    color: AppColors.BASE_COLOR,
                    size: iconSize,
                  ),
                ),
                SizedBox(width: Dimentions.width10),
                Padding(
                  padding: EdgeInsets.only(right: Dimentions.width40),
                  child: BoldText(
                    text: 'Sign out',
                    fontSize: titleFontSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
