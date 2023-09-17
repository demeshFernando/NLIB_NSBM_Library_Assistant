// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';

class WelcomeFont extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final int maxLines;

  const WelcomeFont(
      {super.key,
      this.fontSize = 35,
      this.fontColor = const Color(0xff000000),
      required this.text,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize == 30 ? Dimentions.font30 : fontSize,
        fontFamily: GoogleFonts.roboto().toString(),
        fontWeight: FontWeight.w800,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: maxLines,
    );
  }
}

class TextHeader extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final int maxLines;

  const TextHeader({
    super.key,
    this.fontSize = 24,
    this.fontColor = const Color(0xffFDFDF5),
    required this.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize == 24 ? Dimentions.font24 : fontSize,
        fontFamily: GoogleFonts.roboto().toString(),
        fontWeight: FontWeight.w800,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final int maxLines;

  const SmallText({
    super.key,
    required this.text,
    this.fontColor = const Color(0xff44483E),
    this.fontSize = 14,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize == 14 ? Dimentions.font14 : fontSize,
        overflow: TextOverflow.ellipsis,
        fontFamily: GoogleFonts.roboto().toString(),
      ),
      maxLines: maxLines,
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final int maxLines;

  const BoldText(
      {super.key,
      required this.text,
      this.fontColor = const Color(0xff000000),
      this.fontSize = 12,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize == 12 ? Dimentions.font12 : fontSize,
        fontFamily: GoogleFonts.roboto().toString(),
        fontWeight: FontWeight.w800,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: maxLines,
    );
  }
}
