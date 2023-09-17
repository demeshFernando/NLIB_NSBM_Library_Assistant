import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class NotificationMessage extends StatelessWidget {
  String text = "Heading";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        leadingWidth: double.maxFinite,
        leading: Row(
          children: [
            Icon(Icons.arrow_back, color: AppColors.ICON_WHITE),
            SizedBox(width: Dimentions.width5),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Dimentions.width50,
                child: BoldText(
                  text: '4',
                  fontColor: AppColors.HEADER_TEXT_COLOR,
                ),
              ),
            ),
            SizedBox(width: Dimentions.width20),
            Container(
              width: Dimentions.width250,
              child: TextHeader(text: 'W. D. Fernando'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimentions.height40),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Dimentions.width10),
                BoldText(
                  text: 'Heading: ',
                  fontSize: Dimentions.font16,
                ),
                SizedBox(width: Dimentions.width10),
                SizedBox(
                  width: Dimentions.width300,
                  child: SmallText(
                    text: 'Regarding the taken book from the library.',
                    fontSize: Dimentions.font16,
                    maxLines: 3,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimentions.height10),
          Container(
            height: 1,
            width: Dimentions.width350,
            color: AppColors.CONTAINER_GRAY,
          ),
          SizedBox(height: Dimentions.height10),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Dimentions.width10),
                BoldText(
                  text: 'From:      ',
                  fontSize: Dimentions.font16,
                ),
                SizedBox(width: Dimentions.width10),
                Container(
                  width: Dimentions.width300,
                  child: SmallText(
                    text: 'Demesh Fernando (Librarian)',
                    fontSize: Dimentions.font16,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimentions.height10),
          Container(
            height: 1,
            width: Dimentions.width350,
            color: AppColors.CONTAINER_GRAY,
          ),
          SizedBox(height: Dimentions.height20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimentions.height20),
                    child: SmallText(
                      text: 'Message will be displayed here.',
                      maxLines: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: Dimentions.height90,
        color: AppColors.CONTAINER_LIGHT_GRAY,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimentions.width300,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type the reply here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ),
            SizedBox(width: Dimentions.width20),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: AppColors.BUTTON_COLOR,
                ))
          ],
        ),
      ),
    );
  }
}
