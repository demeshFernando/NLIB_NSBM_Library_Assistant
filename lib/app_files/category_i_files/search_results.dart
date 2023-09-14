import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        title: Padding(
          padding: EdgeInsets.only(left: Dimentions.width20),
          child: TextHeader(
            text: "Harry Potter",
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
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: Dimentions.height40),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Dimentions.height10),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: notificationPane(),
                            );
                          }),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget notificationPane() {
    return InkWell(
      onTap: () {},
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
                  Container(
                    height: Dimentions.height90,
                    width: Dimentions.width40,
                    color: AppColors.CONTAINER_COLOR,
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
                Container(
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
