import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 2), () => Get.off(() => QuranScreen()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: ConstantManager.PRIMARY_COLOR,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ConstantManager.APP_NAME,
                textAlign: TextAlign.center,
                style: ConstantManager.ffUrdu.copyWith(
                  color: ConstantManager.SECONDARY_COLOR,
                  fontSize: SizeConfig.blockSizeHorizontal! * 16.0,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2.0),
              Text(
                'آپکا نام',
                textAlign: TextAlign.center,
                style: ConstantManager.ffUrdu.copyWith(
                  color: ConstantManager.SECONDARY_COLOR,
                  fontSize: SizeConfig.blockSizeHorizontal! * 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
