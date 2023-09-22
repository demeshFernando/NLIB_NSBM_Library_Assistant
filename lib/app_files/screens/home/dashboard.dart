import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/app_files/screens/home/borrowed_books.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/drawer.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/favourite_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/home_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/study_room_selection.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchBookcontroller = TextEditingController();
  int currentTab = 0;
  final List<Widget> screens = [
    const MainHomePage(),
    const StudyRoomSelection(),
    FavouriteBooks(),
    const BorrowedBooks(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const MainHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SlidDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Dimentions.height80,
        backgroundColor: Colors.white,
        title: Column(children: [
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
                    Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 70, // Set the desired width
                          height: 50, // Set the desired height
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu, // Hamburger menu icon
                              color: Colors.white,
                              size: 30, // Set the desired size of the icon
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer(); // Open the drawer
                            },
                          ),
                        );
                      },
                    ),
                    Expanded(
                       child: TextField(
                        controller: searchBookcontroller,
                        //style: const TextStyle(color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          hintText: 'Search a book',
                          hintStyle: const TextStyle(color: Colors.white), 
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 20, 158, 2), // Replace 'yourCustomColor' with your desired color
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent, // Replace 'yourCustomColor' with your desired color
                            ),
                          ),
                        ),
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
                            icon: const Icon(Icons.search),
                            color: Colors.white,
                            iconSize: Dimentions.icon35,
                            onPressed: () {
                              //if there is not text available
                              if (searchBookcontroller.text == "") {
                                DialogBox errorDialog = DialogBox(
                                    context: context,
                                    title: "Error",
                                    description:
                                        "The search field is empty. Please enter a valid text to be searched",
                                    onPressed: () {});
                                errorDialog.errorMessage();
                              } else {
                                Get.toNamed(FormIntegrator.getSearchResults(
                                    searchBookcontroller.text));
                              }
                            },
                          ),
                        ),
                        SizedBox(width: Dimentions.width10),
                        Builder(builder: (context) {
                          return InkWell(
                            onTap: () {
                               Get.toNamed(FormIntegrator.getProfile(1));
                            },
                             child: Container(
                                width: Dimentions.width60, 
                                child: CircleAvatar(
                                radius: Dimentions.radius20,
                                backgroundColor: AppColors.CONTAINER_WHITE,
                              child: ClipOval(
                                child: Image.asset(
                                  "asset/profile/profile.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),)
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
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: AppColors.BUTTON_COLOR, // Change the button's background color
          child: InkWell(
            splashColor: Colors.white, // Change the splash color when tapped
            onTap: () {
              Get.toNamed(FormIntegrator.getNewNotificationMessage());
            },
            child: SizedBox(
              width: 56, // Adjust the button's width
              height: 56, // Adjust the button's height
              child: Icon(
                Icons.message,
                color: AppColors.ICON_WHITE,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.BASE_COLOR,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
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
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: currentTab == 0
                                      ? AppColors.CONTAINER_WHITE
                                      : AppColors.BUTTON_COLOR,
                                ),
                                if (currentTab == 0)
                                  Container(
                                    width: Dimentions.width50, // Adjust the size of the circle
                                    height: 38,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0, // Adjust the border width as needed
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            BoldText(
                              text: 'Home',
                              fontColor: currentTab == 0
                                  ? AppColors.CONTAINER_WHITE
                                  : AppColors.BUTTON_COLOR,
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
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.library_add,
                                  color: currentTab == 1
                                      ? AppColors.CONTAINER_WHITE
                                      : AppColors.BUTTON_COLOR,
                                ),
                                if (currentTab == 1)
                                  Container(
                                    width: Dimentions.width50, // Adjust the size of the circle
                                    height: 38,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0, // Adjust the border width as needed
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            BoldText(
                              text: 'Halls',
                              fontColor: currentTab == 1
                                  ? AppColors.CONTAINER_WHITE
                                  : AppColors.BUTTON_COLOR,
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
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              color: currentTab == 2
                                  ? AppColors.CONTAINER_WHITE
                                  : AppColors.BUTTON_COLOR,
                            ),
                            if (currentTab == 2)
                              Container(
                                width: Dimentions.width50, // Adjust the size of the circle
                                height: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0, // Adjust the border width as needed
                                  ),
                                ),
                              ),
                          ],
                        ),
                        BoldText(
                          text: 'Books',
                          fontColor: currentTab == 2
                              ? AppColors.CONTAINER_WHITE
                              : AppColors.BUTTON_COLOR,
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
