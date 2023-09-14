import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/sign_in.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
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
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.offAllNamed(FormIntegrator.getSignIn());
    });
  }

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
