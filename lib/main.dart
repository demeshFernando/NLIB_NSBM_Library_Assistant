import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/sign_in.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/splash_screen.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/welcome_note1_category1.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/welcome_note2_category1.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/book_categories.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/borrowed_books.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/dynamic_book.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/home_page.dart';
import 'package:nlib_library_assistant/app_files/category_i_files/profile.dart';

import './utils/app_colors.dart';
import 'app_files/category_i_files/study_room_results.dart';

Future<void> main() async {
  //this following command will wait until the widgets are loaded and confirm it.
  //this is a general method
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.BASE_COLOR),
        useMaterial3: true,
      ),
      home: const SignIn(),
    );
  }
}
