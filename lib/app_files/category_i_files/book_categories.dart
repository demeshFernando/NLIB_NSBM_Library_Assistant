import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import '../../widgets/text_formatter.dart';
import '../../utils/app_colors.dart';

class BookCategories extends StatefulWidget {
  const BookCategories({super.key});

  _BookCategories createState() => _BookCategories();
}

class _BookCategories extends State<BookCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        centerTitle: true,
        title: TextHeader(text: 'Book categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimentions.height40),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(Dimentions.height10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryCard(index),
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(int pageIndex) {
    return Container(
      width: Dimentions.width300,
      height: Dimentions.height300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.radius10),
          color: AppColors.BASE_COLOR),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Dimentions.height20),
          Container(
            width: Dimentions.width150,
            height: Dimentions.height100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius10),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(FormIntegrator.getBookCategoryResult(pageIndex));
              },
              child: Center(
                child: Text(
                  'The picture goes here',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: Dimentions.width150,
            height: Dimentions.height50,
            child: Center(
              child: BoldText(text: "Engineering"),
            ),
          )
        ],
      ),
    );
  }
}
