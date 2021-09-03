import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/screens/splash_screen.dart';
import 'package:quran_app/utils/constant_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstantManager.APP_NAME,
      theme: ThemeData(
        primaryColor: ConstantManager.PRIMARY_COLOR,
        accentColor: ConstantManager.SECONDARY_COLOR,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
