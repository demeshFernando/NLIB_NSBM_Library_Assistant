import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import '../../widgets/text_formatter.dart';
import '../../utils/app_colors.dart';

class BookCategory {
  final String name;
  final String imageAssetPath;

  BookCategory(this.name, this.imageAssetPath);
}


class BookCategories extends StatefulWidget {
  const BookCategories({super.key});

  _BookCategories createState() => _BookCategories();
}

class _BookCategories extends State<BookCategories> {

  List<BookCategory> categories = [
  BookCategory("Engineering", "asset/books/book_category/Engineering.jpg"),
  BookCategory("Biological Sciences", "asset/books/book_category/biologicalsciences.png"),
  BookCategory("Computer Science", "asset/books/book_category/ComputerScience.jpg"),
  BookCategory("Accounting", "asset/books/book_category/Accounting.jpg"),
  BookCategory("Finance", "asset/books/book_category/Finance.jpg"),
  BookCategory("Law", "asset/books/book_category/Law.jpg"),

  // Add more categories here
];


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
        title: TextHeader(text: 'Book categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimentions.height40),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(Dimentions.height10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryCard(index,categories[index]),
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(int pageIndex,BookCategory category) {
    return Container(
      width: Dimentions.width300,
      height: Dimentions.height300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.radius30),
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
                category.imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: Dimentions.width150,
            height: Dimentions.height50,
            child: Center(
              child: BoldText(text: category.name),
            ),
          ),
        ],
      ),
    );
  }
}
