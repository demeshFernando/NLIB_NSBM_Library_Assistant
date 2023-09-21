import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../models/book.dart';

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
        Book book = Book(
                            name: "Head First Java",
                            author: "Bert Bates and Kathy Sierra",
                            category: "Computer Science",
                            description: "Head First Java is a complete learning experience in Java and object-oriented programming. With this book, you'll learn the Java language with a unique method ...",
                            imageUrl: "https://m.media-amazon.com/images/I/61M4nbiKAdL._AC_UF1000,1000_QL80_.jpg");
                          Get.toNamed(FormIntegrator.getDynamicBook(book),arguments: book);
        Get.toNamed(FormIntegrator.getDynamicBook(book));
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
