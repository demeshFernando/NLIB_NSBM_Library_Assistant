import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  // ignore: library_private_types_in_public_api
  _BookCategories createState() => _BookCategories();
}

class _BookCategories extends State<BookCategories> {

List<BookCategory> categories = [
  BookCategory("Engineering", "asset/books/book_category/engineering.jpg"),
  BookCategory("Biology", "asset/books/book_category/biology.jpg"),
  BookCategory("Technology", "asset/books/book_category/computerscience.jpg"),
  BookCategory("Business", "asset/books/book_category/business.jpg"),
  BookCategory("Finance", "asset/books/book_category/finance.jpg"),
  BookCategory("Law", "asset/books/book_category/law.jpg"),
  BookCategory("Religion", "asset/books/book_category/religion.jpg"),
  BookCategory("Travel", "asset/books/book_category/travel.jpg"),
  BookCategory("Photography", "asset/books/book_category/photography.jpg"),
  BookCategory("Astronomy", "asset/books/book_category/astronomy.jpg"),
  BookCategory("Self Help", "asset/books/book_category/selfhelp.jpg"),
  BookCategory("Philosophy", "asset/books/book_category/philosophy.jpg"),
  
  
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
        title: const TextHeader(text: 'Book categories'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          GridView.count(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 1, // Spacing between columns
            mainAxisSpacing: 1, // Spacing between rows
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside the GridView
            children: List.generate(categories.length, (index) {
              return categoryCard(index,categories[index]);
            }),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(int pageIndex,BookCategory category) {
    return Container(
      width: Dimentions.width300,
      height: Dimentions.height300,
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
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
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius10),
                  color: AppColors.CONTAINER_WHITE),
              child: Image.asset(
                category.imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Dimentions.width100,
            height: Dimentions.height30,
            child: Center(
              child: BoldText(text: category.name), // Adjust the text size by wrapping it in Text widget
            ),
          ),
        ],
      ),
    );
  }
}
