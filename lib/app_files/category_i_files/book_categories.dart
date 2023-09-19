import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import '../../widgets/text_formatter.dart';
import '../../utils/app_colors.dart';

class BookCategories extends StatefulWidget {
  const BookCategories({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookCategories createState() => _BookCategories();
}

class _BookCategories extends State<BookCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.BASE_COLOR,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.ICON_WHITE,
          ),
        ),
        title: const TextHeader(text: 'Book categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimentions.height40),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
          GestureDetector(
            onTap: () {
              Get.toNamed(FormIntegrator.getBookCategoryResult(pageIndex));
            },
            child: Container(
              width: Dimentions.width250,
              height: Dimentions.height150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius10),
                  color: AppColors.CONTAINER_WHITE),
              child: Image.asset(
                "asset/books/book_category/default.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Dimentions.width150,
            height: Dimentions.height50,
            child: const Center(
              child: BoldText(text: "Engineering"),
            ),
          ),
        ],
      ),
    );
  }
}
