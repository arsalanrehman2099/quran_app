import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String version = "";

  @override
  void initState() {
    super.initState();

    _getVersionNumber();

    Timer(Duration(seconds: 2), () => Get.off(QuranScreen()));
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
              Spacer(),
              Text(
                ConstantManager.APP_NAME,
                textAlign: TextAlign.center,
                style: ConstantManager.htextStyle.copyWith(
                  color: ConstantManager.SECONDARY_COLOR,
                  fontSize: SizeConfig.blockSizeHorizontal! * 16.0,
                ),
              ),
              Spacer(),
              Text(
                'Version ${version.toString()}',
                style: ConstantManager.ktextStyle.copyWith(
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical),
            ],
          ),
        ),
      ),
    );
  }

  _getVersionNumber() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() => version = packageInfo.version);
    });
  }
}
