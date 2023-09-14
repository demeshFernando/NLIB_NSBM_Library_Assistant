import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
            child: Center(
              child: SizedBox(
                width: Dimentions.width200,
                height: Dimentions.height200,
                child: const Image(
                  image: AssetImage('asset/signin_images/NLIB.png'),
                  height: 500,
                  width: 500,
                ),
              ),
            ),
          ),

          // Sign In Text
          Padding(
            padding: EdgeInsets.only(
                top: Dimentions.height8, left: Dimentions.height50),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextHeader(
                text: 'Sign In',
                fontColor: AppColors.NORMAL_TEXT_COLOR,
              ),
            ),
          ),

          SizedBox(height: Dimentions.height20),

          // Student Email Text Field
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimentions.width35,
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.BASE_COLOR,
                filled: true,
                hintText: 'Student Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.BASE_COLOR,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                prefixIcon: const Icon(Icons.email),
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
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                prefixIcon: const Icon(Icons.private_connectivity_sharp),
                suffixIcon: const Icon(Icons.visibility),
              ),
            ),
          ),

          SizedBox(height: Dimentions.height20),

          // Remember Me and Forgot Password
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimentions.width15),
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
                  child: BoldText(
                    text: 'Forgot Password',
                    fontColor: AppColors.BASE_COLOR,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: Dimentions.height20),

          // Sign In Button
          RoundButton(
            buttonText: 'Sign In',
            buttonWidth: Dimentions.width200,
          ),
        ],
      ),
    );
  }
}
