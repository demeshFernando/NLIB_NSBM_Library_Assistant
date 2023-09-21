import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../widgets/images.dart';

class StudyRoomSelection extends StatefulWidget {
  const StudyRoomSelection({super.key});

  @override
  State<StudyRoomSelection> createState() => _StudyRoomSelectionState();
}

class _StudyRoomSelectionState extends State<StudyRoomSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(Dimentions.height20),
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  Get.toNamed(FormIntegrator.getResrvedStudyRoomSelection());
                },
                icon: Icon(
                  Icons.app_registration,
                  color: AppColors.BUTTON_COLOR,
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
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return studyRoom(roomName: 'Study Room1', tileIndex: index);
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget studyRoom({
    required String roomName,
    String seatingCapacity = '1',
    required int tileIndex,
  }) {
    return Container(
      margin: EdgeInsets.all(Dimentions.height40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimentions.radius5),
          bottomRight: Radius.circular(Dimentions.radius5),
        ),
        color: const Color(0xffE2FFBA),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
      ),
      // width: MediaQuery.of(context).size.width * 0.94,
      // height: 500,
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getStudyRoomResults(0));
              },
              child: WelcomeNoteImage(
                  imageUrl: "asset/home_images/study_room/default.png",
                  isPaddingRequired: false)),
          SizedBox(
            height: Dimentions.height20,
          ),
          TextHeader(
            text: roomName,
            fontSize: Dimentions.font16,
            fontColor: AppColors.NORMAL_TEXT_COLOR,
          ),
          SizedBox(height: Dimentions.height20),
          SmallText(text: 'Seating capacity: $seatingCapacity'),
          SizedBox(
            height: Dimentions.height25,
          ),
          Row(
            children: [
              SizedBox(
                width: Dimentions.width5,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(FormIntegrator.getStudyRoomResults(0));
                },
                child: BoldText(
                  text: 'Reserve',
                  fontSize: Dimentions.font14,
                  fontColor: AppColors.WARNING_TEXT_COLOR,
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimentions.height5,
          )
        ],
      ),
    );
  }
}
