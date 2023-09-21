import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimentions.dart';
import '../../widgets/text_formatter.dart';

// ignore: must_be_immutable
class NotificationNewMessage extends StatefulWidget {
  int indexNumber;
  NotificationNewMessage({super.key, this.indexNumber = 0});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationMessageState createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationNewMessage> {
  FocusNode sendingPersonTextfield = FocusNode();
  FocusNode headerFocusNode = FocusNode();
  FocusNode messageBody = FocusNode();
  final toController = TextEditingController();
  final titleController = TextEditingController();
  final messageBodyTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toController.text = widget.indexNumber.toString();
    if (toController.text == "") {
      sendingPersonTextfield.requestFocus();
    } else if (toController.text == "0") {
      sendingPersonTextfield.requestFocus();
    } else {
      headerFocusNode.requestFocus();
    }
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
                  //giving a warning message if the textfield is not empty
                  if (toController.text != "") {
                    sendWarningMessage(
                        "Are you sure",
                        "All the contents that you fileed up will be erased. if you sure click OK to cancel the sending of the message.",
                        context, () {
                      Get.back();
                    });
                  }
                },
                child: Icon(Icons.close, color: AppColors.ICON_WHITE)),
            SizedBox(width: Dimentions.width20),
            SizedBox(
              width: Dimentions.width250,
              child: const TextHeader(text: 'New Message'),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(FormIntegrator.getContactList());
              },
              icon: Icon(Icons.contact_page, color: AppColors.ICON_WHITE))
        ],
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
                SizedBox(
                  width: Dimentions.width300,
                  child: TextField(
                    controller: toController,
                    focusNode: sendingPersonTextfield,
                    decoration:
                        const InputDecoration(hintText: 'index number / name'),
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
                SizedBox(
                  width: Dimentions.width300,
                  child: TextField(
                    focusNode: headerFocusNode,
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
