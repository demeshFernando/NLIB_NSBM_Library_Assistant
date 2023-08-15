import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class fontAppbar extends StatefulWidget {
  final String text;
  final Color color;
  const fontAppbar({super.key, required this.text , required this.color});
  @override
  State<fontAppbar> createState() => _fontAppbarState();
}
class _fontAppbarState extends State<fontAppbar> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(fontSize: 22 , color: widget.color , fontWeight: FontWeight.bold),
    );
  }
}


class cardHead extends StatefulWidget {
  final String text;
  const cardHead({super.key,required this.text});
  @override
  State<cardHead> createState() => _cardHeadState();
}
class _cardHeadState extends State<cardHead> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(fontSize: 17 , color: CupertinoColors.black ),
    );
  }
}




class cardContent extends StatefulWidget {
  final String text;
  const cardContent({super.key , required this.text});
  @override
  State<cardContent> createState() => _cardContentState();
}
class _cardContentState extends State<cardContent> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(fontSize: 14 , color: CupertinoColors.black ),
    );
  }
}

class cardHead2 extends StatefulWidget {
  final String text;
  const cardHead2({super.key , required this.text});
  @override
  State<cardHead2> createState() => _cardHead2State();
}
class _cardHead2State extends State<cardHead2> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(fontSize: 15 , color: CupertinoColors.black ),
    );
  }
}


class cardContent2 extends StatefulWidget {
  final String text;
  const cardContent2({super.key , required this.text});
  @override
  State<cardContent2> createState() => _cardContent2State();
}
class _cardContent2State extends State<cardContent2> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.roboto(fontSize: 14 , color: CupertinoColors.black ),
    );
  }
}