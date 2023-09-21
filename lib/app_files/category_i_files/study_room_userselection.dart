import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

// ignore: must_be_immutable
class StudyRoomUserSelection extends StatefulWidget {
  int requestingHour, requestingMinute, roomId;
  StudyRoomUserSelection(
      {super.key,
      required this.requestingHour,
      required this.requestingMinute,
      required this.roomId});

  @override
  // ignore: library_private_types_in_public_api
  _StudyRoomUserSelectionState createState() => _StudyRoomUserSelectionState();
}

class _StudyRoomUserSelectionState extends State<StudyRoomUserSelection> {
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
                //trowing a warning message
                DialogBox warningMessage = DialogBox(
                    context: context,
                    title: "Are you sure",
                    description:
                        "This cancelation will remove all saved messages and reserved files. So please confirm the message again. confirm it again.",
                    onPressed: () {
                      Get.toNamed(FormIntegrator.getDashboard(1));
                    });
                warningMessage.warningDialogBox();
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
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.back();
              },
              child: Row(
                children: [
                  TextHeader(
                    text: 'Study room 01',
                    fontColor: AppColors.NORMAL_TEXT_COLOR,
                    fontSize: Dimentions.font20,
                    maxLines: 2,
                  ),
                  SizedBox(width: Dimentions.width10),
                  Icon(
                    Icons.edit,
                    color: AppColors.CONTAINER_BLACK,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimentions.height10),
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getStudyRoomResults(1));
              },
              child: Row(
                children: [
                  SmallText(
                    text:
                        '${widget.requestingHour} : ${widget.requestingMinute} | 5:00 PM',
                    fontColor: AppColors.NORMAL_TEXT_COLOR,
                  ),
                  SizedBox(width: Dimentions.width10),
                  Icon(
                    Icons.edit,
                    color: AppColors.CONTAINER_BLACK,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimentions.height10),
            width: double.maxFinite,
            child: SmallText(
              text: 'hall size: 20',
              fontColor: AppColors.NORMAL_TEXT_COLOR,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: Dimentions.height10, left: Dimentions.height10),
            child: TextHeader(
              text: 'Select Students',
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
        margin: EdgeInsets.all(Dimentions.height20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: BoldText(
              text: 'Total student selection: 20',
              fontSize: Dimentions.font16,
            )),
            TextButton(
              onPressed: () {
                sucessMessage(
                    context,
                    "Reservation completed",
                    "Hall you requested is sent for the hall request queue. You can look the status from the reserved hall form.",
                    () {});
              },
              child: BoldText(
                text: 'Request the hall',
                fontColor: AppColors.BUTTON_COLOR,
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
