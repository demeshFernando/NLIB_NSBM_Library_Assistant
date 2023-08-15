import 'package:flutter/material.dart';
import 'package:study_room/pages/study_home.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: studyHome(),
    );
  }
}

























