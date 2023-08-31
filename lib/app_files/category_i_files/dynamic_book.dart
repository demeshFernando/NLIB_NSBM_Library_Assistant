import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class DynamicBook extends StatelessWidget {
  const DynamicBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: Dimentions.height650,
            toolbarHeight: Dimentions.height70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios),
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
                  child: TextHeader(
                    text: 'Harry Potter and the order of the phoenix',
                    fontColor: AppColors.NORMAL_TEXT_COLOR,
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
                          child: SmallText(text: 'by Jk rowlings'),
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
            backgroundColor: AppColors.BUTTON_COLOR,
            onPressed: () {},
            child: Icon(
              Icons.favorite,
              color: AppColors.HEADER_TEXT_COLOR,
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
