import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
                height: Dimentions.height300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimentions.radius20),
                    bottomRight: Radius.circular(Dimentions.radius20),
                  ),
                  color: AppColors.BASE_COLOR,
                ),
              ),
              Positioned(
                top: Dimentions.height220,
                child: CircleAvatar(
                  minRadius: Dimentions.radius80,
                  backgroundColor: AppColors.CONTAINER_WHITE,
                  child: CircleAvatar(
                    radius: Dimentions.radius70,
                    backgroundColor: AppColors.CONTAINER_WHITE,
                    child: ClipOval(
                      child: Image.asset(
                        "asset/profile/default.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Dimentions.height280,
                left: Dimentions.width220,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(Dimentions.height20),
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
                top: Dimentions.height390,
                child: Column(
                  children: [
                    TextHeader(
                      text: 'Olivia Austin',
                      fontColor: AppColors.NORMAL_TEXT_COLOR,
                    ),
                    SizedBox(height: Dimentions.height10),
                    SmallText(
                      text: 'oliva@students.nsbm.ac.lk',
                      fontColor: AppColors.FADED_TEXT_COLOR,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimentions.height160),
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
                      Padding(
                        padding: EdgeInsets.only(left: Dimentions.width2),
                        child: BoldText(
                          text: 'About Me',
                          fontSize: titleFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                children: const [
                  Center(
                    child: SmallText(text: 'This is title number 2'),
                  ),
                ],
              ),
              SizedBox(height: Dimentions.height50),
              ListTile(
                onTap: () {
                  Get.toNamed(FormIntegrator.getFavouriteBooks());
                },
                // leading: const Icon(Icons.favorite),
                title: Row(
                  children: [
                    SizedBox(width: Dimentions.width50),
                    const Icon(Icons.favorite),
                    buttonTiles(
                      titleText: 'My Favourite',
                    ),
                    Container(
                      width: Dimentions.width30,
                      height: Dimentions.height30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
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
                ),
              ),
              SizedBox(height: Dimentions.height30),
              ListTile(
                  onTap: () {
                    Get.toNamed(FormIntegrator.getNotification());
                  },
                  // leading: const Icon(Icons.notifications_none),
                  title: Row(
                    children: [
                      SizedBox(width: Dimentions.width50),
                      const Icon(Icons.notifications_none),
                      buttonTiles(titleText: 'Notification    '),
                      Container(
                        width: Dimentions.width30,
                        height: Dimentions.height30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.WARNING_TEXT_COLOR,
                        ),
                        child: Center(
                          child: BoldText(
                            text: '2',
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
                  )),
              SizedBox(height: Dimentions.height30),
              ListTile(
                onTap: () {
                  DialogBox warningDialog = DialogBox(
                      context: context,
                      title: 'Sign Out',
                      description:
                          "Are you sure to sign out? because sign out may delete all the proper data implications that are finished halfly.",
                      onPressed: () {
                        Get.toNamed(FormIntegrator.getSignIn());
                      });
                  warningDialog.warningDialogBox();
                },
                // leading: Icon(
                //   Icons.arrow_back_ios_new,
                //   color: AppColors.BASE_COLOR,
                //   size: iconSize,
                // ),
                title: Row(
                  children: [
                    SizedBox(width: Dimentions.width50),
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.BASE_COLOR,
                      size: iconSize,
                    ),
                    buttonTiles(titleText: 'Sign Out'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buttonTiles({required String titleText}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: containerPadding),
      child: Padding(
        padding: EdgeInsets.only(left: Dimentions.width2),
        child: BoldText(
          text: titleText,
          fontSize: titleFontSize,
        ),
      ),
    );
  }
}
