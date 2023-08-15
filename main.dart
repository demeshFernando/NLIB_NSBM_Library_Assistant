import 'package:flutter/material.dart';
import 'package:libraryapp/login.dart';
import 'package:libraryapp/loginstudent.dart';
import 'started1.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
     routes: {
      'login':(context) => Mylogin(),
      'register':(context) => MyRegister(),
      'started' :(context) => MyStarted(),

     },
  ));
}
