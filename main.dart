import 'package:flutter/material.dart';
import 'package:libraryapp/login.dart';
import 'package:libraryapp/loginstudent.dart';
import 'started1.dart';
import 'started2.dart';
import 'started3.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
     routes: {
      'login':(context) => Mylogin(),
      'register':(context) => MyRegister(),
      'started' :(context) => MyStarted(),
      'startedone' :(context) => MyStartedone(),
      'startedtwo' :(context) => MyStartedtwo(),

     },
  ));
}
