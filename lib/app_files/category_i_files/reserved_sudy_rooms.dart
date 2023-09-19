import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class ResrvedStudyRooms extends StatefulWidget {
  const ResrvedStudyRooms({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResrvedStudyRoomState createState() => _ResrvedStudyRoomState();
}

class _ResrvedStudyRoomState extends State<ResrvedStudyRooms> {
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
            Icons.arrow_back,
            color: AppColors.ICON_WHITE,
          ),
        ),
        title: const TextHeader(text: 'Reserved Study Rooms'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return listContainer(index);
                }))
          ],
        ),
      ),
    );
  }

  Widget listContainer(int pageId) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(FormIntegrator.getReservedStudyRoomSelectionDetails());
      },
      child: Container(
        width: double.infinity,
        height: Dimentions.height100,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.GRAY_COLOR,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimentions.width150,
                  child: Center(
                    child: BoldText(
                        text: 'Hall Name', fontSize: Dimentions.font20),
                  ),
                ),
                SizedBox(height: Dimentions.height10),
                SizedBox(
                  width: Dimentions.width150,
                  child: const Center(
                      child: SmallText(
                    text: 'Hall ID: ',
                    maxLines: 2,
                  )),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText(
                  text: 'Reserved Date: ',
                  fontSize: Dimentions.font14,
                  fontColor: AppColors.GRAY_COLOR,
                ),
                SizedBox(height: Dimentions.height10),
                BoldText(
                  text: 'Reserved on: ',
                  fontSize: Dimentions.font14,
                ),
                SizedBox(height: Dimentions.height10),
                BoldText(
                  text: 'Total student availability: ',
                  fontSize: Dimentions.font14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
