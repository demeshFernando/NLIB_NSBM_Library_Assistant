// ignore: duplicate_ignore

// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../utils/dimentions.dart';

class StudyRoomResults extends StatefulWidget {
  final int roomId;
  const StudyRoomResults({super.key, required this.roomId});

  @override
  State<StudyRoomResults> createState() => _studyRoomResultsState();
}

// ignore: camel_case_types
class _studyRoomResultsState extends State<StudyRoomResults> {
  final TextEditingController _hourcontroller = TextEditingController();
  final TextEditingController _minutecontroller = TextEditingController();
  final FocusNode _hourFocusing = FocusNode();
  final FocusNode _minuteFocusing = FocusNode();
  final List<bool> _selections = [true, false];
  bool isAM = true;

  @override
  void initState() {
    super.initState();
    int getHour = DateTime.now().hour;
    _selections[0] = getHour < 12 ? true : false;
    _selections[1] = getHour < 12 ? false : true;
    _hourFocusing.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: Dimentions.icon35,
                color: AppColors.ICON_WHITE,
              ),
            ),
            expandedHeight: Dimentions.height250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: fontAppbar(
                text: 'Study Room',
                color: AppColors.CONTAINER_WHITE,
              ),
              background: Image.asset(
                './asset/home_images/study_room/1.jpg',
                fit: BoxFit.cover,
                // opacity: const AlwaysStoppedAnimation(1),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.transparent,
            snap: false,
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(Dimentions.height8),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        //Study Room Card
                        Container(
                          padding: EdgeInsets.all(Dimentions.height20),
                          // alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: AppColors.CONTAINER_GRAY,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.CONTAINER_GRAY,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(1, 2))
                              ]),
                          // height: MediaQuery.of(context).size.height * 2,
                          width: Dimentions.width350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Dimentions.height8,
                              ),
                              const cardHead(
                                text: 'Study Room 001',
                              ),
                              SizedBox(
                                height: Dimentions.height8,
                              ),
                              const cardContent(
                                  text:
                                      'This is a medium size studyroom available from 9am to 5 pm.'),
                              SizedBox(
                                height: Dimentions.height20,
                              ),
                              const cardContent(
                                  text: 'No of students per entry: 8 max'),
                              SizedBox(
                                height: Dimentions.height60,
                              ),
                            ],
                          ),
                        ),

                        //Check Availability Card
                        SizedBox(height: Dimentions.height20),
                        Container(
                          width: Dimentions.width350,
                          // height: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: AppColors.CONTAINER_WHITE,
                            borderRadius:
                                BorderRadius.circular(Dimentions.radius12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.CONTAINER_GRAY,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(1, 2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimentions.width20,
                              top: Dimentions.width40,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cardHead(
                                  text: 'Check Avaialbility',
                                  fontSize: Dimentions.font15,
                                ),
                                SizedBox(
                                  height: Dimentions.height20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeField(
                                      focusNode: _hourFocusing,
                                      controller: _hourcontroller,
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: Dimentions.font50),
                                      unit: 'Hour ',
                                      hexfill: AppColors.BASE_COLOR,
                                      hexborderfocus: AppColors.BUTTON_COLOR,
                                    ),
                                    SizedBox(
                                      width: Dimentions.width3,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: Dimentions.font70,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimentions.width3,
                                    ),
                                    timeField(
                                      focusNode: _minuteFocusing,
                                      controller: _minutecontroller,
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: Dimentions.font50),
                                      unit: 'Minutes ',
                                      hexfill: AppColors.CONTAINER_WHITE,
                                      hexborderfocus: AppColors.CONTAINER_BLACK,
                                    ),
                                    SizedBox(
                                      width: Dimentions.width10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          ToggleButtons(
                                            isSelected: _selections,
                                            onPressed: (int index) {
                                              setState(() {
                                                for (int buttonIndex = 0;
                                                    buttonIndex <
                                                        _selections.length;
                                                    buttonIndex++) {
                                                  if (buttonIndex == index) {
                                                    _selections[buttonIndex] =
                                                        true;
                                                    if (index == 0) {
                                                      isAM = true;
                                                    } else {
                                                      isAM = false;
                                                    }
                                                  } else {
                                                    _selections[buttonIndex] =
                                                        false;
                                                  }
                                                }
                                              });
                                            },
                                            fillColor:
                                                AppColors.CONTAINER_LIGHT_BLUE,
                                            direction: Axis.vertical,
                                            borderWidth: 1,
                                            borderColor:
                                                AppColors.BORDER_BLACK_COLOR,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimentions.radius12),
                                            ),
                                            children: const [
                                              SmallText(text: 'AM'),
                                              SmallText(text: 'PM'),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              //if hour or the minute or the both are empty
                                              if ((_hourcontroller.text ==
                                                      "") ||
                                                  (_minutecontroller.text ==
                                                      "") ||
                                                  (_hourcontroller.text == "" &&
                                                      _minutecontroller.text ==
                                                          "")) {
                                                warningTextMessage(
                                                    context,
                                                    "Time Constraints",
                                                    "Enter the correct hour and minute to be proceed.",
                                                    () {
                                                  _hourFocusing.requestFocus();
                                                });
                                              }

                                              //if hour is not in valuable state
                                              else if (int.parse(
                                                      _hourcontroller.text) >
                                                  12) {
                                                warningTextMessage(
                                                    context,
                                                    "Hour Constraint",
                                                    "Enter the hour in the correct format. Only 1 - 12 hour can be acceptable. differentiate those time limits from AM or PM limits.",
                                                    () {
                                                  _hourFocusing.requestFocus();
                                                });
                                              }

                                              //if minute is not in valuable state
                                              else if (int.parse(
                                                      _minutecontroller.text) >
                                                  59) {
                                                warningTextMessage(
                                                    context,
                                                    "Minute Constraint",
                                                    "The minute limit only acceptable within 0 - 59. please adhere to the constraint.",
                                                    () {
                                                  _minuteFocusing
                                                      .requestFocus();
                                                });
                                              }
                                              //if the time level is between 4 to 5
                                              else if (int.parse(_hourcontroller
                                                          .text) <
                                                      5 &&
                                                  int.parse(_hourcontroller
                                                          .text) >=
                                                      4) {
                                                warningTextMessage(
                                                    context,
                                                    "Timeout",
                                                    "Time is too closed to close the premises. Please try again tomorrow",
                                                    () {});
                                              }

                                              // if the timeline is too early
                                              else if (_selections[0] == true &&
                                                  (int.parse(_hourcontroller
                                                              .text) >=
                                                          0 &&
                                                      int.parse(_hourcontroller
                                                              .text) <
                                                          9)) {
                                                warningTextMessage(
                                                    context,
                                                    "Too early",
                                                    "The premises is still not open. please try again at 9:00 AM",
                                                    () {});
                                              }

                                              //if the booking happens when the NSBM is closed
                                              else if (int.parse(_hourcontroller
                                                          .text) >=
                                                      5 &&
                                                  _selections[1] == true) {
                                                warningTextMessage(
                                                    context,
                                                    "Closed",
                                                    "NSBM is closed please try again tommorow",
                                                    () {});
                                              }

                                              //if both are ok
                                              else {
                                                Get.toNamed(FormIntegrator
                                                    .getStudyRoomUserSelection(
                                                        int.parse(
                                                            _hourcontroller
                                                                .text),
                                                        int.parse(
                                                            _minutecontroller
                                                                .text),
                                                        widget.roomId));
                                              }
                                            },
                                            child: SmallText(
                                              text: 'Ok',
                                              fontColor: AppColors.BUTTON_COLOR,
                                            )),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void warningTextMessage(BuildContext context, String title,
      String description, VoidCallback onPressed) {
    DialogBox conveyTheWarning = DialogBox(
        context: context,
        title: title,
        description: description,
        onPressed: onPressed);
    conveyTheWarning.warningDialogBox();
  }

  @override
  void dispose() {
    _hourcontroller.dispose();
    _minutecontroller.dispose();
    super.dispose();
  }
}

// ignore: camel_case_types
class fontAppbar extends StatelessWidget {
  final String text;
  final Color color;
  const fontAppbar({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return TextHeader(
      text: text,
      fontColor: color,
    );
  }
}

// ignore: camel_case_types
class cardHead extends StatelessWidget {
  final String text;
  final double fontSize;
  const cardHead({super.key, required this.text, this.fontSize = 17});
  @override
  Widget build(BuildContext context) {
    return TextHeader(
      text: text,
      fontSize: fontSize == 17 ? Dimentions.font16 : fontSize,
      fontColor: AppColors.NORMAL_TEXT_COLOR,
    );
  }
}

class cardContent extends StatelessWidget {
  final String text;
  const cardContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SmallText(
      text: text,
      fontSize: Dimentions.font14,
    );
  }
}

class timeField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle style;
  final String unit;
  final Color hexborderfocus;
  final Color hexfill;
  final FocusNode focusNode;

  const timeField(
      {super.key,
      required this.controller,
      required this.style,
      required this.unit,
      required this.hexfill,
      required this.hexborderfocus,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.greenAccent,
      width: Dimentions.width100,
      height: Dimentions.height150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              // contentPadding: EdgeInsets.only(top:1,bottom:1),
              filled: true,
              fillColor: hexfill,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: Dimentions.width3,
                  color: hexborderfocus,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent),
              ),
            ),
            controller: controller,
            cursorColor: AppColors.BUTTON_COLOR,
            style: style,
            maxLength: 2,
          ),
          Padding(
            padding: EdgeInsets.all(Dimentions.height4),
            child: SmallText(
              text: unit,
              fontColor: AppColors.TEXT_GRAY,
            ),
          ),
        ],
      ),
    );
  }
}
