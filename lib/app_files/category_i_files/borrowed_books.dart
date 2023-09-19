import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class BorrowedBooks extends StatefulWidget {
  const BorrowedBooks({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BorrowedBooks createState() => _BorrowedBooks();
}

class _BorrowedBooks extends State<BorrowedBooks> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }

  Widget listContainer(int pageId) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(FormIntegrator.getBorrowedBookSpecificDetails(pageId));
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
                        text: 'Head First Java checking the overlapping',
                        fontSize: Dimentions.font20),
                  ),
                ),
                SizedBox(height: Dimentions.height10),
                SizedBox(
                  width: Dimentions.width150,
                  child: const Center(
                      child: SmallText(
                    text: 'kathy sierra, checking the overlowing cabaility',
                    maxLines: 2,
                  )),
                ),
              ],
            ),
            Container(
              height: Dimentions.height100,
              width: Dimentions.width50,
              color: AppColors.BASE_COLOR,
              child: Image.asset(
                "asset/books/default.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText(
                  text: '2023/23/23',
                  fontSize: Dimentions.font14,
                  fontColor: AppColors.GRAY_COLOR,
                ),
                SizedBox(height: Dimentions.height10),
                BoldText(
                  text: '2023/23/23',
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
