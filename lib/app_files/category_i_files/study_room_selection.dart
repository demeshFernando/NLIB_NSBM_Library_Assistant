import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        title: TextHeader(text: 'Study Rooms'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // alignment: Alignment.center,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return studyRoom(roomName: 'Study Room1');
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget studyRoom({
    required String roomName,
  }) {
    return Container(
      margin: EdgeInsets.all(Dimentions.height40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimentions.radius5),
          bottomRight: Radius.circular(Dimentions.radius5),
        ),
        color: Color(0xffE2FFBA),
        boxShadow: [
          const BoxShadow(
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
          WelcomeNoteImage(imageUrl: "", isPaddingRequired: false),
          SizedBox(
            height: Dimentions.height20,
          ),
          TextHeader(
            text: roomName,
            fontSize: Dimentions.font16,
            fontColor: AppColors.NORMAL_TEXT_COLOR,
          ),
          SizedBox(
            height: Dimentions.height25,
          ),
          Row(
            children: [
              SizedBox(
                width: Dimentions.width5,
              ),
              TextButton(
                onPressed: () {},
                child: BoldText(
                  text: 'Book',
                  fontSize: Dimentions.font14,
                  fontColor: AppColors.WARNING_TEXT_COLOR,
                ),
              ),
              TextButton(
                onPressed: () {},
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
