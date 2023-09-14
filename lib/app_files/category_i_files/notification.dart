import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.BASE_COLOR,
        title: TextHeader(text: 'Notifications'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimentions.height10),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: notificationPane(),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget notificationPane() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Dimentions.height5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
          bottom: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
        ),
        color: AppColors.CONTAINER_COLOR,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: Dimentions.width10),
          Container(
            color: Colors.white,
            height: Dimentions.height100,
            width: Dimentions.width50,
            child: Stack(
              children: [
                Container(
                  height: Dimentions.height100,
                  width: Dimentions.width40,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: Dimentions.width20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimentions.width300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeader(
                      text: 'Available Now',
                      fontColor: AppColors.NOTIFICATION_TEXT_COLOR,
                    ),
                    Icon(
                      Icons.notifications,
                      color: AppColors.CONTAINER_BLACK,
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimentions.width300,
                child: SmallText(
                  text: 'the element of style message will be displayed here.',
                  maxLines: 3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
