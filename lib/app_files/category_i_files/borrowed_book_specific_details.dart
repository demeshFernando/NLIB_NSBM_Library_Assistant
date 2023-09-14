import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimentions.dart';
import '../../widgets/text_formatter.dart';

class BorrowedBookDetails extends StatefulWidget {
  final int pageId;
  BorrowedBookDetails({required this.pageId});
  _BorrowedBookDetailsState createState() => _BorrowedBookDetailsState();
}

class _BorrowedBookDetailsState extends State<BorrowedBookDetails> {
  bool isClickedFavouriteButton = false;
  Color buttonBackColor = AppColors.CONTAINER_WHITE,
      iconColor = AppColors.ICON_GRAY;

  void stateChange() {
    isClickedFavouriteButton = !isClickedFavouriteButton;
    setState(() {
      buttonBackColor = isClickedFavouriteButton
          ? AppColors.BUTTON_COLOR
          : AppColors.CONTAINER_WHITE;
      iconColor =
          isClickedFavouriteButton ? AppColors.ICON_WHITE : AppColors.ICON_GRAY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: Dimentions.height650,
            toolbarHeight: Dimentions.height70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimentions.height20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimentions.height5, bottom: Dimentions.height10),
                decoration: BoxDecoration(
                    color: AppColors.CONTAINER_WHITE,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.radius20),
                        topRight: Radius.circular(Dimentions.radius20))),
                child: Center(
                  child: SizedBox(
                    width: Dimentions.width300,
                    child: Center(
                      child: TextHeader(
                        text:
                            'Harry Potter and the order of the phoenix checking whehther the overflowing happenning properly',
                        fontColor: AppColors.NORMAL_TEXT_COLOR,
                        maxLines: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: AppColors.BASE_COLOR,
            flexibleSpace: FlexibleSpaceBar(
                // background: Image.asset('name', width: double.maxFinite, fit: BoxFit.cover,),
                ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              width: Dimentions.width300,
                              child: Center(
                                  child: SmallText(
                                text: 'by Jk rowlings',
                                maxLines: 3,
                              ))),
                        ),
                        SizedBox(height: Dimentions.height50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SmallText(text: 'The book is taken on'),
                                SmallText(text: 'on 2023/23/23'),
                              ],
                            ),
                            SizedBox(width: Dimentions.width40),
                            Column(
                              children: [
                                SmallText(text: 'The book has to be return,'),
                                BoldText(text: 'on 2023/23/23'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimentions.height90,
        padding: EdgeInsets.only(
          left: Dimentions.width20,
          right: Dimentions.width20,
          top: Dimentions.height10,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            backgroundColor: buttonBackColor,
            onPressed: () {
              stateChange();
            },
            child: Icon(
              Icons.favorite,
              color: iconColor,
            ),
          )
        ]),
      ),
    );
  }
}
