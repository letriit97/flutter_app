import 'package:flutter/material.dart';
import 'package:food_apps/consts/const.dart';
import 'package:food_apps/controllers/auth_controller.dart';
import 'package:food_apps/controllers/theme_controller.dart';
import 'package:food_apps/views/splash_screen.dart';
import 'package:food_apps/utils/app_themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,

      // home: Onboarding(),
      home: SplashScreen(),
    );
  }
}
