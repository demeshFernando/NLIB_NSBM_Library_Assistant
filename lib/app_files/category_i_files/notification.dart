import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class notification extends StatefulWidget {
  var tileNotification = <bool>[true, true, true, false, false, false];
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
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
                itemCount: widget.tileNotification.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(FormIntegrator.getNotificationMessage());
                    },
                    child: widget.tileNotification[index]
                        ? activeNotificationContainer(index)
                        : inactiveNotificationContainer(index),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: AppColors.BUTTON_COLOR,
          child: Icon(
            Icons.add,
            color: AppColors.ICON_WHITE,
          ),
          onPressed: () {
            Get.toNamed(FormIntegrator.getNewNotificationMessage());
          },
        ),
      ),
    );
  }

  Widget activeNotificationContainer(int pageId) {
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
          // Container(
          //   color: Colors.white,
          //   height: Dimentions.height100,
          //   width: Dimentions.width50,
          //   child: Stack(
          //     children: [
          //       Container(
          //         height: Dimentions.height100,
          //         width: Dimentions.width40,
          //         decoration: BoxDecoration(
          //           border: Border(
          //             top: BorderSide(color: Colors.black),
          //             left: BorderSide(color: Colors.black),
          //             right: BorderSide(color: Colors.black),
          //             bottom: BorderSide(color: Colors.black),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(width: Dimentions.width20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimentions.width300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimentions.width250,
                      child: TextHeader(
                          text: 'Available Now',
                          fontColor: AppColors.NOTIFICATION_TEXT_COLOR),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.tileNotification[pageId] =
                              !widget.tileNotification[pageId];
                        });
                      },
                      icon: Icon(
                        Icons.notifications,
                        color: AppColors.CONTAINER_BLACK,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimentions.width300,
                child: SmallText(
                  text: 'the element of style message will be displayed here.',
                  maxLines: 2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget inactiveNotificationContainer(int pageId) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Dimentions.height5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
          bottom: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
        ),
        color: AppColors.CONTAINER_WHITE,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: Dimentions.width10),
          // Container(
          //   color: Colors.white,
          //   height: Dimentions.height100,
          //   width: Dimentions.width50,
          //   child: Stack(
          //     children: [
          //       Container(
          //         height: Dimentions.height100,
          //         width: Dimentions.width40,
          //         decoration: BoxDecoration(
          //           border: Border(
          //             top: BorderSide(color: Colors.black),
          //             left: BorderSide(color: Colors.black),
          //             right: BorderSide(color: Colors.black),
          //             bottom: BorderSide(color: Colors.black),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(width: Dimentions.width20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimentions.width300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimentions.width250,
                      child: TextHeader(
                        text: 'Available Now',
                        fontColor: AppColors.NORMAL_TEXT_COLOR,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.tileNotification[pageId] =
                              !widget.tileNotification[pageId];
                        });
                      },
                      icon: iconPanel(Icons.notifications_off),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimentions.width300,
                child: SmallText(
                  text: 'the element of style message will be displayed here.',
                  maxLines: 2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget iconPanel(IconData icon) {
    return Icon(
      icon,
      color: AppColors.CONTAINER_BLACK,
    );
  }
}
