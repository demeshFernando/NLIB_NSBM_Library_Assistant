import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimentions.dart';
import '../../widgets/text_formatter.dart';

class NotificationNewMessage extends StatefulWidget {
  _NotificationMessageState createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationNewMessage> {
  FocusNode sendingPersonTextfield = FocusNode();

  @override
  void initState() {
    super.initState();
    sendingPersonTextfield.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        leadingWidth: double.maxFinite,
        leading: Row(
          children: [
            SizedBox(width: Dimentions.width10),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, color: AppColors.ICON_WHITE)),
            SizedBox(width: Dimentions.width20),
            Container(
              width: Dimentions.width250,
              child:
                  TextHeader(text: 'This is the header of the title holder.'),
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
                headingTiles(text: 'To:           '),
                SizedBox(width: Dimentions.width10),
                Container(
                  width: Dimentions.width300,
                  child: TextField(
                    focusNode: sendingPersonTextfield,
                    decoration:
                        InputDecoration(hintText: 'index number / name'),
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
                headingTiles(text: 'Heading: '),
                SizedBox(width: Dimentions.width10),
                Container(
                  width: Dimentions.width300,
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'Header of the message'),
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
                    child: TextFormField(
                      maxLines: 100,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Type your message here',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimentions.radius10),
                        ),
                      ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.BUTTON_COLOR,
              onPressed: () {},
              child: Icon(
                Icons.send,
                color: AppColors.ICON_WHITE,
              ),
            ),
            SizedBox(width: Dimentions.width10)
          ],
        ),
      ),
    );
  }

  Widget headingTiles({required String text}) {
    return BoldText(
      text: text,
      fontSize: Dimentions.font16,
    );
  }
}
