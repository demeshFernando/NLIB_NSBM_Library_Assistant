import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nlib_library_assistant/app_files/services/auth.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dialog_box.dart';
import '../../utils/dimentions.dart';

import '../../widgets/rounded_button.dart';
import '../../widgets/text_formatter.dart';
import '../shared/loading.dart';
//import 'started1.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInrState();
}

class _SignInrState extends State<SignIn> {

  bool rememberMe = true, isPasswordVisibilityStatus = false;
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameFocusNode.requestFocus();
  }

  //instance of the auth service
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String username = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Logo
            Padding(
              padding: EdgeInsets.only(top: Dimentions.height5),
              child: Center(
                child: SizedBox(
                  width: Dimentions.width200,
                  height: Dimentions.height200,
                  child: const Image(
                    image: AssetImage('asset/signin_images/NLIB.png'),
                  ),
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
      
            SizedBox(height: Dimentions.height20),
      
            // Student Email Text Field
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width35,
              ),
              child: TextFormField(
                controller: usernameController,
                focusNode: usernameFocusNode,
                decoration: InputDecoration(
                  fillColor: AppColors.BASE_COLOR,
                  filled: true,
                  hintText: 'username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.BASE_COLOR,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                onChanged: (value){
                  setState((){
                    username = value;
                  });
                },
              ),
            ),
      
            SizedBox(height: Dimentions.height20),
      
            // Password Text Field
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimentions.width35,
              ),
              child: TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: !isPasswordVisibilityStatus ? true : false,
                decoration: InputDecoration(
                  fillColor: AppColors.BASE_COLOR,
                  filled: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.BASE_COLOR,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisibilityStatus =
                              !isPasswordVisibilityStatus;
                        });
                      },
                      icon: Icon(!isPasswordVisibilityStatus
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                }
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
                      Get.toNamed(FormIntegrator.getPasswordResetGuidelines());
                    },
                    child: BoldText(
                      text: 'Credential Guidlines',
                      fontColor: AppColors.BASE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
      
            SizedBox(height: Dimentions.height20),
      
            // Sign In Button
            GestureDetector(
              onTap: () {
                print(
                    "username is: ${usernameController.text} and password is: ${passwordController.text}");
                //special entry
                if (usernameController.text != "" &&
                    passwordController.text != "") {
                  Get.toNamed(FormIntegrator.getWelcomeNote1Category1());
                }
      
                //if the username field is empty
                else if (usernameController.text == "") {
                  warningMessage(
                      context, "Error", "Username field cannot kept empty.", () {
                    usernameFocusNode.requestFocus();
                  });
                }
                //if the password field is empty
                else if (passwordController.text == "") {
                  warningMessage(
                      context, "Error", "Password field cannot kept empty", () {
                    passwordFocusNode.requestFocus();
                  });
                }
                //if the rememberme switch is not checked
                else if (!rememberMe) {
                  infoMessage(context, "Remember you",
                      "You didn't check remember me option. this may always make you sign in again and again. System recommendation is to on that switch. Whould you like to move on without any furthur message. And please be aware that if this is not the your phone then please don't switch on it.",
                      () {
                    Get.toNamed(FormIntegrator.getWelcomeNote1Category1());
                  });
                }
                //if both are in a proper way
                else {
                  errorMessage(context, "Error",
                      "There is not proper credential recognition to move on. Please try again.",
                      () {
                    usernameFocusNode.requestFocus();
                  });
                }
              },
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(username, password);
                    if(result == null){
                      setState(() {
                        error = 'Could not sign in with those credentials';
                        loading = false;
                      });
                    
                    }
                  }
                },
                 style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.BASE_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.green[900]),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void warningMessage(
    BuildContext context,
    String title,
    String description,
    VoidCallback onPressed,
  ) {
    DialogBox warningMessage = DialogBox(
      context: context,
      title: title,
      description: description,
      onPressed: onPressed,
    );
    warningMessage.warningDialogBox();
  }

  void errorMessage(
    BuildContext context,
    String title,
    String description,
    VoidCallback onPressed,
  ) {
    DialogBox warningMessage = DialogBox(
      context: context,
      title: title,
      description: description,
      onPressed: onPressed,
    );
    warningMessage.errorMessage();
  }

  void infoMessage(
    BuildContext context,
    String title,
    String description,
    VoidCallback onPressed,
  ) {
    DialogBox warningMessage = DialogBox(
      context: context,
      title: title,
      description: description,
      onPressed: onPressed,
    );
    warningMessage.cautionMessage();
  }
}
