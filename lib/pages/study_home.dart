import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wakelock/wakelock.dart';

class studyHome extends StatefulWidget {
  const studyHome({super.key});

  @override
  State<studyHome> createState() => _studyHomeState();
}

class _studyHomeState extends State<studyHome> {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();

    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Study Rooms',
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
            ),
            backgroundColor: CupertinoColors.systemBackground,
            leading: const Icon(
              Icons.arrow_back_rounded,
              size: 35,
              color: CupertinoColors.black,
            ),
            expandedHeight: 100,
            snap: false,
            pinned: false,
            floating: false,
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  // alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: HexColor('#E2FFBA'),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.94,
                        // height: 500,
                        child: Column(
                          children: [
                            Image.asset('assets/hometop.jpg'),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Study Room 1',
                              style: GoogleFonts.roboto(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      /*get availability here  ---> temp text*/ 'BOOKED',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: HexColor('#FF0000')),
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      /*get availability here  ---> temp text*/ 'RESERVE',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: HexColor('#FF0000')),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: HexColor('#FFDADA'),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.94,

                        // height: 500,
                        child: Column(
                          children: [
                            Image.asset('assets/studyroom2.jpg'),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Study Room 1',
                              style: GoogleFonts.roboto(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      /*get availability here  ---> temp text*/ 'BOOKED',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: HexColor('#FF0000')),
                                    )),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    /*get availability here  ---> temp text*/ 'RESERVE',
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: HexColor('#FF0000')),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: HexColor('#E2D0F9'),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width * 0.94,
                        // height: 500,
                        child: Column(
                          children: [
                            Image.asset('assets/studyroom3.jpg'),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Study Room 1',
                              style: GoogleFonts.roboto(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      /*get availability here  ---> temp text*/ 'BOOKED',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: HexColor('#FF0000')),
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      /*get availability here  ---> temp text*/ 'RESERVE',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: HexColor('#FF0000')),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
