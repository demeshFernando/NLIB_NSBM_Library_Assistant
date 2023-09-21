import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

// ignore: must_be_immutable
class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final searchContactController = TextEditingController();
  final FocusNode searchContactFocusNode = FocusNode();
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
            Icons.arrow_back_rounded,
            color: AppColors.ICON_WHITE,
          ),
        ),
        title: const Expanded(child: TextHeader(text: 'Contact List')),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Container(
              margin: EdgeInsets.all(Dimentions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: Dimentions.width300,
                      child: TextField(
                        focusNode: searchContactFocusNode,
                        controller: searchContactController,
                        decoration: const InputDecoration(
                          hintText: 'Search here',
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        //if the text box is empty
                        if (searchContactController.text == "") {
                          warningMessage(context, "Error",
                              "Enter a valid contact name or an index to be searched.",
                              () {
                            searchContactFocusNode.requestFocus();
                          });
                        } else {
                          //search result of the user.
                        }
                      },
                      icon: const Icon(Icons.search)),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: ((context, index) => addedStudentTile())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void warningMessage(BuildContext context, String title, String description,
      VoidCallback onPressed) {
    DialogBox warningMessage = DialogBox(
        context: context,
        title: title,
        description: description,
        onPressed: onPressed);
    warningMessage.warningDialogBox();
  }

  Widget addedStudentTile() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.all(Dimentions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        "asset/profile/default.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                // width: Dimentions.width200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimentions.width200,
                      child: BoldText(
                        text: 'W. Demesh Fernando',
                        fontSize: Dimentions.font16,
                      ),
                    ),
                    SizedBox(height: Dimentions.height5),
                    SizedBox(
                        width: Dimentions.width200,
                        child: const SmallText(text: '22863 | 21.1 | SE | MF')),
                  ],
                ),
              ),
              SizedBox(width: Dimentions.width10),
              IconButton(
                onPressed: () {
                  Get.toNamed(FormIntegrator.getNewNotificationMessage(
                      indexNumber: 22863));
                },
                icon: Icon(
                  Icons.message,
                  color: AppColors.BUTTON_COLOR,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 1,
          margin: EdgeInsets.only(
            left: Dimentions.width20,
            right: Dimentions.width20,
          ),
          color: AppColors.CONTAINER_GRAY,
        )
      ],
    );
  }
}
