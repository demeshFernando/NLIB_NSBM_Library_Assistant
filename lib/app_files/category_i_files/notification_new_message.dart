import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimentions.dart';
import '../../widgets/text_formatter.dart';

class NotificationNewMessage extends StatefulWidget {
  const NotificationNewMessage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationMessageState createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationNewMessage> {
  FocusNode sendingPersonTextfield = FocusNode();
  FocusNode messageBody = FocusNode();
  final toController = TextEditingController();
  final titleController = TextEditingController();
  final messageBodyTextController = TextEditingController();

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
            SizedBox(
              width: Dimentions.width250,
              child: const TextHeader(text: 'New Message'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimentions.height40),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Dimentions.width10),
                headingTiles(text: 'To:           '),
                SizedBox(width: Dimentions.width10),
                Expanded(
                  child: TextField(
                    controller: toController,
                    focusNode: sendingPersonTextfield,
                    decoration:
                        const InputDecoration(hintText: 'Library Assistant'),
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
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Dimentions.width10),
                headingTiles(text: 'Heading: '),
                SizedBox(width: Dimentions.width10),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Header of the message'),
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
                      controller: messageBodyTextController,
                      focusNode: messageBody,
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
              onPressed: () {
                if (toController.text == "") {
                  sendWarningMessage(
                    "Sending Error",
                    "Please enter the name of the person who wants to recieve the message. Even you can enter his/her index number",
                    context,
                    () {
                      sendingPersonTextfield.requestFocus();
                    },
                  );
                } else if (messageBodyTextController.text.length < 5) {
                  sendWarningMessage(
                    "Sending error",
                    "The message does not contain any body",
                    context,
                    () {
                      messageBody.requestFocus();
                    },
                  );
                } else if (titleController.text == "") {
                  sendWarningMessage(
                    "Are you sure",
                    "There is no heading for the message",
                    context,
                    () {},
                  );
                } else {
                  DialogBox sucessMessage = DialogBox(
                    context: context,
                    title: "Message sent",
                    description:
                        "The message is sent to the recepient sucessfully",
                    onPressed: () {},
                  );
                  sucessMessage.succesfullMessage();
                }
              },
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

  void sendWarningMessage(String title, String message, BuildContext context,
      VoidCallback onPressed) {
    DialogBox warningMessage = DialogBox(
      context: context,
      title: title,
      description: message,
      onPressed: onPressed,
    );
    warningMessage.warningDialogBox();
  }
}
