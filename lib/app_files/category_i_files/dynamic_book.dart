import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class DynamicBook extends StatefulWidget {
  final int pageId;
  const DynamicBook({super.key, required this.pageId});

  _DynamicBookState createState() => _DynamicBookState();
}

class _DynamicBookState extends State<DynamicBook> {
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
            toolbarHeight: Dimentions.height100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.ICON_WHITE,
                    )),
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
                    child: TextHeader(
                      text: 'Harry Potter and the order of the phoenix',
                      fontColor: AppColors.NORMAL_TEXT_COLOR,
                      maxLines: 10,
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
                                ),
                              )),
                        ),
                        SizedBox(height: Dimentions.height50),
                        Row(
                          children: [
                            SizedBox(width: Dimentions.width80),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pointSettings(
                                      text: 'No. of copies available: 04'),
                                  pointSettings(text: 'No. of copies taken: 03')
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimentions.height50),
                        Container(
                          width: Dimentions.width210,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimentions.radius20),
                            color: AppColors.CONTAINER_WHITE,
                            border: Border.all(color: AppColors.CONTAINER_GRAY),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: AppColors.GRAY_COLOR,
                              ),
                              SizedBox(width: Dimentions.width10),
                              SmallText(
                                text: 'the book will available on',
                                fontColor: AppColors.FADED_TEXT_COLOR,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: SmallText(
                            text:
                                'this is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookdescription of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the bookthis is the description of the book',
                            maxLines: 100,
                          ),
                        )
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

  Widget pointSettings({required String text}) {
    return Row(
      children: [
        Container(
          height: Dimentions.height10,
          width: Dimentions.width10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.CONTAINER_BLACK),
        ),
        SizedBox(width: Dimentions.width10),
        SmallText(text: '$text'),
      ],
    );
  }
}
