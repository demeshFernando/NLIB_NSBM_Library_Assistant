import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import '../../utils/dimentions.dart';
//import 'loginstudent.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: Dimentions.width250,
          height: Dimentions.height250,
          color: AppColors.BASE_COLOR,
          // child: Image.asset(
          //   'assets/register.png',

          // ),
        ),
      ),
    );
  }
}
