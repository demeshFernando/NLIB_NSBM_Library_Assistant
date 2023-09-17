import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class BookCategoryResult extends StatefulWidget {
  final int pageId;

  const BookCategoryResult({super.key, required this.pageId});
  _BookCategoryResultState createState() => _BookCategoryResultState();
}

class _BookCategoryResultState extends State<BookCategoryResult> {
  var bookFavourites = <bool>[true, false, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
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
        title: TextHeader(text: 'Category Name'),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimentions.height10),
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookFavourites.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(FormIntegrator.getDynamicBook(index));
                        },
                        child: notificationPane(index),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationPane(int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: Dimentions.height5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
          bottom: BorderSide(color: AppColors.NOTIFICATION_TEXT_COLOR),
        ),
        color: AppColors.CONTAINER_COLOR,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: Dimentions.width10),
          Container(
            color: Colors.white,
            height: Dimentions.height100,
            width: Dimentions.width50,
            child: Image.asset(
              "asset/books/default.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: Dimentions.width20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimentions.width300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimentions.width250,
                      child: TextHeader(
                        text: 'Book Name',
                        fontColor: AppColors.NOTIFICATION_TEXT_COLOR,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bookFavourites[index] = !bookFavourites[index];
                        });
                      },
                      icon: Icon(
                        bookFavourites[index]
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        color: AppColors.CONTAINER_BLACK,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimentions.width300,
                child: SmallText(
                  text:
                      'the book description will be displayed here if there one.',
                  maxLines: 2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
