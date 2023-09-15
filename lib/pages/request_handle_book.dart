import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class requestHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      HexColor("#8DC63F"),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(" Requests",style: GoogleFonts.roboto(color: Colors.black),),
        ),
        body: ListView.builder(
              itemCount: 10, // replaces with the amount of requests in the DB - getList.length
              itemBuilder: (context, index) {
              return Card(
                // shadowColor: Colors.black,
                color: HexColor("#e6ffc4"),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          msg(index + 1),
                          style: GoogleFonts.roboto(fontSize: 17),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Accept'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor("#356B07"),
                                // foregroundColor: HexColor("#356B07")
                            ),
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Reject'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor("#356B07"),
                                // foregroundColor: HexColor("#356B07")
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      },
    ));
  }
}

  String msg(int id) {
    return 'massage';
        //getMsg.id';
}
