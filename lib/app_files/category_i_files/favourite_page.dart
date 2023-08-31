import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';
import './drawer.dart';

class FavouriteBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SlidDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimentions.height80,
        backgroundColor: AppColors.CONTAINER_WHITE,
        title: Container(
          child: Column(children: [
            SizedBox(height: Dimentions.height10),
            Center(
              child: Container(
                height: Dimentions.height60,
                width: Dimentions.width380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius30),
                  color: AppColors.BASE_COLOR,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: Dimentions.width200,
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: 'Search here'),
                              )),
                          SizedBox(
                            width: Dimentions.width10,
                          ),
                          SizedBox(width: Dimentions.width10),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: Dimentions.width50,
                                  height: Dimentions.height50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.BASE_COLOR),
                                  child: Icon(Icons.search),
                                ),
                              ),
                              SizedBox(width: Dimentions.width10),
                              Builder(builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Container(
                                    height: Dimentions.height50,
                                    width: Dimentions.width50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.CONTAINER_WHITE),
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(
                            width: Dimentions.width5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Container(
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
