import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_room/util/fonts.dart';
import 'package:study_room/util/textfields.dart';
import 'package:wakelock/wakelock.dart';
import 'package:hexcolor/hexcolor.dart';

class studyRoom01 extends StatefulWidget {
  const studyRoom01({super.key});

  @override
  State<studyRoom01> createState() => _studyRoom01State();
}

class _studyRoom01State extends State<studyRoom01> {
  TextEditingController _hourcontroller = TextEditingController();
  TextEditingController _minutecontroller = TextEditingController();
  List<bool> _selections = List.generate(2, (index) => false);
  bool isAM = true; //**  AM/PM button , if AM selected this is true  **//
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Icon(
              Icons.arrow_back_rounded,
              size: 35,
              color: CupertinoColors.white,
            ),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: const fontAppbar(
                text: 'Study Room',
                color: CupertinoColors.white,
              ),
              background: Image.asset(
                'assets/hometop.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(1),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        //Study Room Card
                        Container(
                          padding: const EdgeInsets.all(20),
                          // alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: HexColor("#E2FFBA"),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(1, 2))
                              ]),
                          // height: MediaQuery.of(context).size.height * 2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const cardHead(
                                text: 'Study Room 001',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const cardContent(
                                  text:
                                      'This is a medium size studyroom available from 9am to 5 pm.'),
                              const SizedBox(
                                height: 20,
                              ),
                              const cardContent(
                                  text: 'No of students per entry: 8 max'),
                              const SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // RESERVE text button function //
                                    },
                                    child: Text(
                                      'RESERVE',
                                      style: GoogleFonts.roboto(
                                        color: HexColor('#BA1A1A'),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        //Check Availability Card
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // height: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: HexColor('#EEEEE7'),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(1, 2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const cardHead2(text: 'Check Avaialbility'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeField(
                                      controller: _hourcontroller,
                                      style: const TextStyle(
                                          height: 1, fontSize: 50),
                                      unit: 'Hour ',
                                      hexfill: '#8DC63F',
                                      hexborderfocus: '#356B07',
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(
                                        ':',
                                        style: TextStyle(
                                            fontSize: 70,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    timeField(
                                      controller: _minutecontroller,
                                      style: const TextStyle(
                                          height: 1, fontSize: 50),
                                      unit: 'Minutes ',
                                      hexfill: '#E3E3DC',
                                      hexborderfocus: '#1A1C18',
                                    ),
                                    const SizedBox(
                                      width: 10,
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
                                            fillColor: HexColor('#BBECEA'),
                                            direction: Axis.vertical,
                                            borderWidth: 1,
                                            borderColor: HexColor('#44483E'),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                            children: const [
                                              Text('AM'),
                                              Text('PM')
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

                                              // ** Reset textbutton function **//


                                            },
                                            child: Text(
                                              'Reset',
                                              style: GoogleFonts.roboto(
                                                  color: HexColor('#356B07'),
                                                  fontSize: 15),
                                            )),TextButton(
                                            onPressed: () {

                                              // ** Reset textbutton function **//


                                            },
                                            child: Text(
                                              'Ok',
                                              style: GoogleFonts.roboto(
                                                  color: HexColor('#356B07'),
                                                  fontSize: 15),
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

  @override
  void dispose() {
    _hourcontroller.dispose();
    _minutecontroller.dispose();
    super.dispose();
  }
}
