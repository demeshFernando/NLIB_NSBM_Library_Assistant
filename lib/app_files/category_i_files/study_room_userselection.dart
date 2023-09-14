import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class StudyRoomUserSelection extends StatefulWidget {
  @override
  _StudyRoomUserSelectionState createState() => _StudyRoomUserSelectionState();
}

class _StudyRoomUserSelectionState extends State<StudyRoomUserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        centerTitle: true,
        title: TextHeader(text: 'User Selection'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(FormIntegrator.getDashboard());
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
                    text: '9:00 AM - 10:30 AM',
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
                    decoration: InputDecoration(
                        hintText: 'Search Students using index/name'),
                  ),
                ),
                SizedBox(width: Dimentions.width10),
                IconButton(
                  onPressed: () {
                    Get.toNamed(FormIntegrator.getUserSearchResult());
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
                      physics: NeverScrollableScrollPhysics(),
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
                child: Container(
              child: BoldText(
                text: 'Total student selection: 20',
                fontSize: Dimentions.font16,
              ),
            )),
            TextButton(
              onPressed: () {},
              child: BoldText(
                text: 'Request the hall',
                fontColor: AppColors.LINK_TEXT_COLOR,
              ),
            )
          ],
        ),
      ),
    );
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
                      SmallText(text: 'BSC (HONS) in software engineering'),
                      SmallText(text: '22863'),
                      SmallText(text: 'batch: 21.1'),
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
