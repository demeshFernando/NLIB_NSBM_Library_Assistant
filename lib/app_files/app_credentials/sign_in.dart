import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import '../../utils/dimentions.dart';

import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';
//import 'started1.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInrState();
}

class _SignInrState extends State<SignIn> {
  bool rememberMe = false; // Store the switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Padding(
              padding: EdgeInsets.only(top: Dimentions.height5),
              child: Center(
                child: Container(
                  width: Dimentions.width220,
                  height: Dimentions.height220,
                  color: AppColors.BASE_COLOR,
                  // child: Image.asset(
                  //   'assets/register.png',

                  // ),
                ),
              ),
            ),

            // Sign In Text
            Padding(
              padding: EdgeInsets.only(
                  top: Dimentions.height60, left: Dimentions.height20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextHeader(
                  text: 'Sign In',
                  fontColor: AppColors.NORMAL_TEXT_COLOR,
                ),
              ),
            ),

            SizedBox(height: Dimentions.height30),

            // Student Email Text Field
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width35,
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.green.shade50,
                  filled: true,
                  hintText: 'Student text',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.BASE_COLOR,
                    ),
                    borderRadius: BorderRadius.vertical(),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),

            SizedBox(height: Dimentions.height20),

            // Password Text Field
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width35,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: AppColors.BASE_COLOR,
                  filled: true,
                  hintText: 'Your password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.BASE_COLOR,
                    ),
                    borderRadius: BorderRadius.vertical(),
                  ),
                  prefixIcon: Icon(Icons.private_connectivity_sharp),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
            ),

            SizedBox(height: Dimentions.height20),

            // Remember Me and Forgot Password
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimentions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Switch(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value;
                          });
                        },
                        activeColor: AppColors.BASE_COLOR,
                      ),
                      SmallText(
                        text: 'Remember Me',
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Add logic for the "Forgot Password" action
                    },
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            FormIntegrator.getPasswordResetGuidelines());
                      },
                      child: BoldText(
                        text: 'Credential Guidlines',
                        fontColor: AppColors.BASE_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: Dimentions.height20),

            // Sign In Button
            GestureDetector(
              onTap: () {
                Get.toNamed(FormIntegrator.getWelcomeNote1Category1());
              },
              child: RoundButton(
                buttonText: 'Sign In',
                buttonWidth: Dimentions.width200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
