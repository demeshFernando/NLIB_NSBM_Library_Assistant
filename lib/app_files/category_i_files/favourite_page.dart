import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';
import './drawer.dart';

class FavouriteBooks extends StatefulWidget {
  var tagFavouriteButton = <bool>[
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
  ];
  _FavouriteBooksState createState() => _FavouriteBooksState();
}

class _FavouriteBooksState extends State<FavouriteBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.BASE_COLOR,
        centerTitle: true,
        title: TextHeader(text: 'Favourite Books'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tagFavouriteButton.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(FormIntegrator.getDynamicBook(1));
                    },
                    child: Container(
                      width: double.infinity,
                      height: Dimentions.height100,
                      margin: EdgeInsets.only(
                        left: Dimentions.width15,
                        right: Dimentions.width15,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.CONTAINER_GRAY,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: Dimentions.height90,
                            width: Dimentions.width50,
                            color: AppColors.BASE_COLOR,
                          ),
                          SizedBox(width: Dimentions.width50),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoldText(
                                text: 'Head First Java',
                                fontSize: Dimentions.font14,
                              ),
                              SizedBox(height: Dimentions.height10),
                              SmallText(
                                text: 'kathy sierra',
                                fontSize: Dimentions.font10,
                              ),
                            ],
                          ),
                          SizedBox(width: Dimentions.width100),
                          FloatingActionButton(
                            backgroundColor: widget.tagFavouriteButton[index]
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                            onPressed: () {
                              setState(() {
                                widget.tagFavouriteButton[index] =
                                    !widget.tagFavouriteButton[index];
                              });
                            },
                            child: Icon(
                              widget.tagFavouriteButton[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: widget.tagFavouriteButton[index]
                                  ? AppColors.ICON_WHITE
                                  : AppColors.CONTAINER_BLACK,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
