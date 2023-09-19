import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import '../../utils/dimentions.dart';
import '../../widgets/rounded_button.dart';
import '../../utils/app_colors.dart';
import '../../widgets/text_formatter.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainHomePage createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  // ignore: prefer_final_fields
  double _schaleFactor = 0.8, _height = Dimentions.height220;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      //we need to wrap _CurrentPageValue inside the setState value because as soon
      //as we change the value it needs to be recorded.
      setState(() {
        _currentPageValue =
            pageController.page!; //this ! defines this can be null
      });
    });
  }

  //and after the needs are done we need to clear them as soon as possible
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //first user name page
            Container(
              width: Dimentions.width350,
              height: Dimentions.height100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: AppColors.BASE_COLOR,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: Dimentions.width15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimentions.height25),
                    const SmallText(
                      text: 'Welcome Back',
                    ),
                    const TextHeader(text: 'HI! Olivia'),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimentions.height40),

            //heading messages as advertisments
            SizedBox(
              //color: Colors.redAccent,
              height: _height,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  }),
            ),

            DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.CONTAINER_COLOR,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            SizedBox(height: Dimentions.height20),
            //seat count
            mainCard(
              cardIndex: 0,
              mainHeader: 'Seat Count',
              description:
                  'Check wetherh your seat ready and available before visiting inside the library',
              buttonText: 'Refresh',
              imageUrl: "./asset/home_images/1.png",
              bottom: Dimentions.height100,
              pictureContainerHeight: Dimentions.height200,
            ),
            SizedBox(height: Dimentions.height20),

            //book search page
            mainCard(
              cardIndex: 1,
              mainHeader: 'Search Book',
              description:
                  'You can search a book title and check whether the book is available.',
              buttonText: 'Search',
              imageUrl: "./asset/home_images/1.png",
              bottom: Dimentions.height100,
              pictureContainerHeight: Dimentions.height200,
              isButtonShow: false,
            ),
            SizedBox(height: Dimentions.height20),

            mainCard(
              cardIndex: 2,
              mainHeader: 'Reserve a study room',
              description:
                  'You can reserve a study room through the app, if rooms are available',
              buttonText: 'Check',
              imageUrl: "./asset/home_images/2.png",
              isButtonShow: false,
            ),
            SizedBox(height: Dimentions.height20),
          ],
        ),
      ),
    );
  }

  Widget mainCard({
    required mainHeader,
    required String description,
    required String buttonText,
    required String imageUrl,
    required int cardIndex,
    double left = 25,
    double bottom = 200,
    double pictureContainerHeight = 300,
    bool isButtonShow = true,
  }) {
    return Stack(
      children: [
        Container(
          width: Dimentions.width350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimentions.radius20),
            color: AppColors.CONTAINER_COLOR,
          ),
          child: Column(
            children: [
              //book search picture
              Container(
                margin: const EdgeInsets.all(1),
                height: pictureContainerHeight == 300
                    ? Dimentions.height300
                    : pictureContainerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.radius20),
                    topRight: Radius.circular(Dimentions.radius20),
                  ),
                  color: AppColors.CONTAINER_COLOR,
                ),
              ),
              //book search discription
              Container(
                margin: const EdgeInsets.all(1),
                height: Dimentions.height250,
                width: Dimentions.width350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimentions.radius20),
                    bottomRight: Radius.circular(Dimentions.radius20),
                  ),
                  color: AppColors.CONTAINER_WHITE,
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dimentions.height20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeader(
                        text: mainHeader,
                        fontColor: AppColors.NORMAL_TEXT_COLOR,
                      ),
                      const SmallText(text: 'In Library'),
                      SizedBox(height: Dimentions.height50),
                      SmallText(
                        text: description,
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isButtonShow
                              ? GestureDetector(
                                  onTap: () {
                                    if (cardIndex == 0) {
                                    } else if (cardIndex == 2) {
                                      Get.toNamed(FormIntegrator
                                          .getStudyRoomSelection());
                                    }
                                  },
                                  child: RoundButton(
                                    buttonText: buttonText,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: left == 25 ? Dimentions.width25 : left,
            bottom: bottom == 200 ? Dimentions.height200 : bottom,
            width: Dimentions.width300,
            height: Dimentions.height400,
            child: Image.asset(imageUrl))
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      //using this simple math we are trying to get what is active and what is not
      //for example let's say that we are in the index = 0 page so for that page
      //currentpagevalue is also 0. not matter what we multiply always it will
      //become 0. but finally we get 0. which means currschale page will remain
      //1 for current active page.
      var currSchale = 1 - (_currentPageValue - index) * (1 - _schaleFactor);
      var currTrans = _height * (1 - currSchale) / 2;
      matrix = Matrix4.diagonal3Values(1, currSchale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //this section we are referring the next slide when there is a current slide
    //is showing.
    else if (index == _currentPageValue.floor() + 1) {
      //in here when there is a current page active automatically (_currentPageValue - index + 1) * (1 - _schaleFactor) will become 0 because of (_currentPageValue - index + 1) = 0. so automatically schalefactor will become = 0.8
      var currSchale =
          _schaleFactor + (_currentPageValue - index + 1) * (1 - _schaleFactor);
      //in here currtrans is for change the front page's position
      var currTrans = _height * (1 - currSchale) / 2;
      matrix = Matrix4.diagonal3Values(1, currSchale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //so let's refer the previous page
    else if (index == _currentPageValue.floor() - 1) {
      //in here when there is a current page active automatically (_currentPageValue - index + 1) * (1 - _schaleFactor) will become 0 because of (_currentPageValue - index + 1) = 0. so automatically schalefactor will become = 0.8
      var currSchale = 1 - (_currentPageValue - index) * (1 - _schaleFactor);
      //in here currtrans is for change the front page's position
      var currTrans = _height * (1 - currSchale) / 2;
      matrix = Matrix4.diagonal3Values(1, currSchale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    //so for any other type of pages
    else {
      var currSchale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currSchale, 1)
        ..setTranslationRaw(0, _height * (1 - currSchale) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(FormIntegrator.getDynamicBook(index));
            },
            child: Container(
              //color: Colors.redAccent,
              width: Dimentions.width350,
              height: _height,
              padding: EdgeInsets.all(Dimentions.radius10),
              margin: EdgeInsets.only(
                  left: Dimentions.width10, right: Dimentions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius30),
                border: Border.all(color: AppColors.CONTAINER_BLACK),
                color: index.isEven
                    ? AppColors.CONTAINER_WHITE
                    : AppColors.CONTAINER_COLOR,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BoldText(text: 'name of the author'),
                  TextHeader(
                      text: 'name of the author and the title is be here.',
                      fontColor: AppColors.NORMAL_TEXT_COLOR),
                  const SmallText(
                    text:
                        'description will be the description will be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the descriptionwill be the description',
                    maxLines: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
