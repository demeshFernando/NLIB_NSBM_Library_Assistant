import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class requestHandleHall extends StatefulWidget {
  const requestHandleHall({super.key});

  @override
  State<requestHandleHall> createState() => _requestHandleHallState();
}

class _requestHandleHallState extends State<requestHandleHall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#3F63C6"),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          " Requests",
          style: GoogleFonts.roboto(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount:
            1, // replaces with the amount of requests in the DB - getList.length
        itemBuilder: (context, index) {
          return Card(
            // shadowColor: Colors.black,
            color: HexColor("#c4e6ff"),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ListVNames()
                            // Text(
                            //   msg(index + 1),
                            //   style: GoogleFonts.roboto(fontSize: 17),
                            // ),
                            // Text('data'),
                          ],
                        ),
                        Text('Massage')
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#07356B"),
                          // foregroundColor: HexColor("#356B07")
                        ),
                        child: const Text('Accept'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#07356B"),
                          // foregroundColor: HexColor("#356B07")
                        ),
                        child: const Text('Reject'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Text msg() {
//   List<String> names = ["s", "a", "l"];
//   int x;
//   for (x = 0; x < names.length; x++) {
//      ListView.builder(itemBuilder: (context, index)){
//        // return {Text(names[x-1]) , Text};
//      // }
//
//
//   }
//   return const Text("Massage");
// }

// Text ListVNames
// ListView.builder(
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// leading: const Icon(Icons.list),
// trailing: const Text(
// "GFG",
// style: TextStyle(color: Colors.green, fontSize: 15),
// ),
// title: Text("List item $index"));
// }),

class ListVNames extends StatefulWidget {
  const ListVNames({super.key});


  @override
  State<ListVNames> createState() => _ListVNamesState();

}

class _ListVNamesState extends State<ListVNames> {

  // List<String> names = {"a", "b" , "b" ,"",""};

  @override
  Widget build(BuildContext context) {
    List<String> names = ["a" ,"b","q","w","w"] ;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5 ,
        itemBuilder:(BuildContext context, int index ){
          return Text(
            //method for getting name
                names[index]
          );

    });
  }
}
