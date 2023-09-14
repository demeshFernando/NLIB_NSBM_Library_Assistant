import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/borrowed_books.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/drawer.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/favourite_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/home_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/study_room_selection.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [
    MainHomePage(),
    StudyRoomSelection(),
    FavouriteBooks(),
    BorrowedBooks(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainHomePage();
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SlidDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimentions.height80,
        backgroundColor: Colors.white,
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: Dimentions.width50,
                            height: Dimentions.height50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.BASE_COLOR,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.search),
                              iconSize: Dimentions.icon24,
                              onPressed: () {
                                Get.toNamed(FormIntegrator.getSearchResults());
                              },
                            ),
                          ),
                          SizedBox(width: Dimentions.width10),
                          Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                width: Dimentions.width50,
                                height: Dimentions.height50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
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
              ),
            ),
          ]),
        ),
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.BUTTON_COLOR,
        onPressed: () {
          Get.toNamed(FormIntegrator.getNewNotificationMessage());
        },
        child: Icon(
          Icons.message,
          color: AppColors.ICON_WHITE,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: Dimentions.height60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: Dimentions.width5),
                    MaterialButton(
                      minWidth: Dimentions.width40,
                      onPressed: () {
                        setState(() {
                          currentScreen = MainHomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          ),
                          BoldText(
                            text: 'Home',
                            fontColor: currentTab == 0
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: Dimentions.width40,
                      onPressed: () {
                        setState(() {
                          currentScreen = StudyRoomSelection();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.library_add,
                            color: currentTab == 1
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          ),
                          BoldText(
                            text: 'Halls',
                            fontColor: currentTab == 1
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: Dimentions.width40,
                      onPressed: () {
                        setState(() {
                          currentScreen = BorrowedBooks();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: currentTab == 2
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          ),
                          BoldText(
                            text: 'Halls',
                            fontColor: currentTab == 2
                                ? AppColors.BUTTON_COLOR
                                : AppColors.CONTAINER_GRAY,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Dimentions.width100)
            ],
          ),
        ),
      ),
    );
  }
}
