import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

// ignore: must_be_immutable
class ReservedStudyRoomDetails extends StatefulWidget {
  int roomId;
  ReservedStudyRoomDetails({super.key, required this.roomId});

  @override
  // ignore: library_private_types_in_public_api
  _ReservedStudyRoomDetailsState createState() =>
      _ReservedStudyRoomDetailsState();
}

class _ReservedStudyRoomDetailsState extends State<ReservedStudyRoomDetails> {
  final searchUserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.BASE_COLOR,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.ICON_WHITE,
          ),
        ),
        title: const TextHeader(text: 'User Selection'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(FormIntegrator.getDashboard(1));
              },
              icon: Icon(
                Icons.cancel,
                color: AppColors.WARNING_TEXT_COLOR,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(Dimentions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHeader(
                  text: 'Study room 01',
                  fontColor: AppColors.NORMAL_TEXT_COLOR,
                  fontSize: Dimentions.font20,
                  maxLines: 2,
                ),
                TextButton(
                    onPressed: () {
                      sucessMessage(
                          context,
                          "Completed!",
                          "Hall request updated with the current information",
                          () {});
                    },
                    child: BoldText(
                        text: 'Update', fontColor: AppColors.BUTTON_COLOR))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimentions.height10),
            width: double.maxFinite,
            child: SmallText(
              text: '9:00 AM - 10:30 AM',
              fontColor: AppColors.NORMAL_TEXT_COLOR,
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimentions.height10),
            width: double.maxFinite,
            child: SmallText(
              text: 'hall size: 20 | confirmation pending',
              fontColor: AppColors.NORMAL_TEXT_COLOR,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: Dimentions.height10, left: Dimentions.height10),
            child: TextHeader(
              text: 'Selected Students',
              fontColor: AppColors.NORMAL_TEXT_COLOR,
            ),
          ),
          Container(
            width: double.maxFinite,
            height: Dimentions.height50,
            margin: EdgeInsets.all(Dimentions.height10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchUserController,
                    decoration: const InputDecoration(
                        hintText: 'Search Students using index/name'),
                  ),
                ),
                SizedBox(width: Dimentions.width10),
                IconButton(
                  onPressed: () {
                    //if there is no text to be proceed
                    if (searchUserController.text == "") {
                      warningTextMessage(
                          context,
                          "Error",
                          "Please search the user with an index number or with any other method.",
                          () {});
                    }
                    //else condition
                    else {
                      Get.toNamed(FormIntegrator.getUserSearchResult(
                          searchUserController.text));
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: AppColors.CONTAINER_BLACK,
                  ),
                ),
              ],
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimentions.height10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: BoldText(
              text: 'Total student selection: 20',
              fontSize: Dimentions.font16,
            )),
            GestureDetector(
              onTap: () {
                DialogBox reConfirmation = DialogBox(
                    context: context,
                    title: "Are you sure?",
                    description:
                        "Will you expect to change the hall? because the chaning the hall means reconfiguring all the details again?",
                    onPressed: () {
                      Get.toNamed(FormIntegrator.getStudyRoomUserSelection(
                          9, 55, widget.roomId));
                    });
                reConfirmation.cautionMessage();
              },
              child: Icon(
                Icons.edit,
                color: AppColors.CONTAINER_BLACK,
              ),
            ),
            TextButton(
              onPressed: () {
                //confirming the cacelation
                warningTextMessage(context, "Confirm",
                    "Are you sure to cancel the hall request?", () {
                  Get.back();
                });
              },
              child: BoldText(
                text: 'Cancel Request',
                fontColor: AppColors.WARNING_TEXT_COLOR,
              ),
            )
          ],
        ),
      ),
    );
  }

  void sucessMessage(BuildContext context, String title, String description,
      VoidCallback onPressed) {
    DialogBox sucessMessage = DialogBox(
        context: context,
        title: title,
        description: description,
        onPressed: onPressed);
    sucessMessage.succesfullMessage();
  }

  void warningTextMessage(BuildContext context, String title,
      String description, VoidCallback onPressed) {
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
              Expanded(
                child: SizedBox(
                  // width: Dimentions.width200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        text: 'W. Demesh Fernando',
                        fontSize: Dimentions.font16,
                      ),
                      SizedBox(height: Dimentions.height5),
                      const SmallText(
                          text: 'BSC (HONS) in software engineering'),
                      const SmallText(text: '22863'),
                      const SmallText(text: 'batch: 21.1'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: Dimentions.width10),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.WARNING_TEXT_COLOR,
                  ))
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
