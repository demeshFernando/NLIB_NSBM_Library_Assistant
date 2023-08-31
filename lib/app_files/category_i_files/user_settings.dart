import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';

import '../../utils/dimentions.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  bool _allowNotifications = false; // Store the switch state
  bool _privacyVisibility = false; // Store the privacy visibility switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        title: TextHeader(
          text: "Settings",
          fontColor: AppColors.HEADER_TEXT_COLOR,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.ICON_WHITE,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitch("Allow Notifications", _allowNotifications, (value) {
              setState(() {
                _allowNotifications = value;
              });
            }),
            Container(
              padding: EdgeInsets.only(
                left: Dimentions.width20,
                right: Dimentions.width50,
              ),
              child: SmallText(
                text:
                    "Any lorem word about 20 word count Any lorem word about 20",
                maxLines: 2,
              ),
            ),
            SizedBox(height: Dimentions.height10),
            customSwitch("Privacy Visibility", _privacyVisibility, (value) {
              setState(() {
                _privacyVisibility = value;
              });
            }),
            Container(
              padding: EdgeInsets.only(
                left: Dimentions.width20,
                right: Dimentions.width50,
              ),
              child: SmallText(
                text:
                    "Any lorem word about 20 word count Any lorem word about 20",
                maxLines: 2,
              ),
            ),
            SizedBox(height: Dimentions.height350),
            Align(
              alignment: Alignment.center,
              child: RoundButton(
                  buttonText: 'Save setttings',
                  buttonWidth: Dimentions.width300),
            ),
          ],
        ),
      ),
    );
  }

  Widget customSwitch(String text, bool value, void Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimentions.height50,
          left: Dimentions.width16,
          right: Dimentions.width16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextHeader(text: text, fontColor: AppColors.NORMAL_TEXT_COLOR),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
