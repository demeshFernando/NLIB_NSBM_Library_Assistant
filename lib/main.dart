import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nlib_library_assistant/app_files/app_credentials/splash_screen.dart';
import 'package:nlib_library_assistant/form_integration/form_integrater.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';

Future<void> main() async {
  //this following command will wait until the widgets are loaded and confirm it.
  //this is a general method
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.BASE_COLOR),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: FormIntegrator.initial,
      getPages: FormIntegrator.routes,
    );
  }
}
