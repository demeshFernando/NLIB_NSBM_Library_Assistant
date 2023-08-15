import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class timeField extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle style;
  final String unit;
  final String hexborderfocus;
  final String hexfill;

  const timeField(
      {super.key,
      required this.controller,
      required this.style,
      required this.unit,
      required this.hexfill,
      required this.hexborderfocus});

  @override
  State<timeField> createState() => _timeFieldState();
}

class _timeFieldState extends State<timeField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.greenAccent,
      width: 100,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(

            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              // contentPadding: EdgeInsets.only(top:1,bottom:1),
              filled: true,
              fillColor: HexColor(widget.hexfill),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: HexColor(widget.hexborderfocus),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent

                ),
              ),
            ),
            controller: widget.controller,
            cursorColor: HexColor('#356B07'),
            style: widget.style,
            maxLength: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              widget.unit,
              style:
                  GoogleFonts.roboto(color: HexColor('#44483E'), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
