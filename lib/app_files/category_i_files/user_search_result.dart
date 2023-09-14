import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/rounded_button.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class UserSearchResult extends StatefulWidget {
  _UserSearchResultState createState() => _UserSearchResultState();
}

class _UserSearchResultState extends State<UserSearchResult> {
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
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Expanded(child: TextHeader(text: 'User Result: 222')),
      ),
      body: SingleChildScrollView(
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
              GestureDetector(
                  onTap: () {},
                  child: RoundButton(
                    buttonText: 'Add',
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
