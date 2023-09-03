import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();


    slides.add(
      Slide(
        title: "Slide 1",
        description: "This is the first slide description.",
        pathImage: "assets/flash1.png",
        backgroundColor: HexColor('#FFFFFF'),
      ),
    );

    slides.add(
      Slide(
        title: "Slide 2",
        description: "This is the second slide description.",
        pathImage: "assets/flash2.png",
        backgroundColor: HexColor('#F2F2F2'),
      ),
    );

    slides.add(
      Slide(
        title: "Slide 3",
        description: "This is the third slide description.",
        pathImage: "assets/flash3.png",
        backgroundColor: HexColor('#FFFFFF'),
      ),
    );
  }

  void onDonePress() {
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      showNextBtn:false,
      showPrevBtn: false,
      slides: slides,
      onDonePress: onDonePress,


    );
  }
}
