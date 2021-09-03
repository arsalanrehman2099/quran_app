import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantManager {
  static const PRIMARY_COLOR = Colors.black;
  static const SECONDARY_COLOR = Colors.white;

  static const APP_NAME = "Masmoo Atul Quran";

  static var ktextStyle = GoogleFonts.montserrat();
  static var htextStyle = GoogleFonts.fredokaOne();

  static const URDU_FONT_FAMILY = 'Jameel Noori Nastaleeq';
  static var utextStyle = TextStyle(fontFamily: URDU_FONT_FAMILY);


  static showtoast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.white,
      textColor: Colors.grey.shade900,
    );
  }

  static snackBar(String? message, context, {duration=3}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: duration),
      ),
    );
  }



  // default app bar
  static kAppbar(text) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: htextStyle.copyWith(color: PRIMARY_COLOR),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: ConstantManager.PRIMARY_COLOR),
    );
  }


}
