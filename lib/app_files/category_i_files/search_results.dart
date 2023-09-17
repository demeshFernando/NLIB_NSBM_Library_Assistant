import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class SearchResult extends StatefulWidget {
  final String searchText;
  const SearchResult({super.key, required this.searchText});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.BASE_COLOR,
        title: Padding(
          padding: EdgeInsets.only(left: Dimentions.width20),
          child: TextHeader(
            text: widget.searchText,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: Dimentions.width30),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.ICON_WHITE,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Dimentions.width10,
              top: Dimentions.height10,
            ),
            width: double.maxFinite,
            child: TextHeader(
              text: 'Search Result',
              fontColor: AppColors.NORMAL_TEXT_COLOR,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: Dimentions.height40),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return notificationPane(index);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationPane(int tileId) {
    return InkWell(
      onTap: () {
        Get.toNamed(FormIntegrator.getDynamicBook(tileId));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: Dimentions.height5),
        color: AppColors.CONTAINER_WHITE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: Dimentions.width10),
            Container(
              color: Colors.white,
              height: Dimentions.height100,
              width: Dimentions.width50,
              child: Stack(
                children: [
                  SizedBox(
                    height: Dimentions.height90,
                    width: Dimentions.width40,
                    child: Image.asset(
                      "asset/books/default.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: Dimentions.width20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimentions.width300,
                  child: SmallText(
                    text: 'J. K. Rowlings',
                    fontColor: AppColors.NORMAL_TEXT_COLOR,
                  ),
                ),
                SizedBox(
                  width: Dimentions.width300,
                  child: BoldText(
                    text: 'Harry potter chamber of secrets',
                    fontSize: Dimentions.font20,
                    maxLines: 2,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
