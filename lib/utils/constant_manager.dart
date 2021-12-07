import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantManager {
  static const PRIMARY_COLOR = Colors.black;
  static const SECONDARY_COLOR = Colors.white;

  static const APP_NAME = "قرآن مجید";

  static var ffEnglish = GoogleFonts.montserrat();
  static var ffHeader = GoogleFonts.fredokaOne();

  static const URDU_FONT_FAMILY = 'Jameel Noori Nastaleeq';
  static var ffUrdu = TextStyle(fontFamily: URDU_FONT_FAMILY);

  static const ARABIC_FONT_FAMILY = 'MUHAMMADI QURANIC';
  static var ffArabic = TextStyle(fontFamily: ARABIC_FONT_FAMILY);


  // default app bar
  static kAppbar(text) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        text,
        style: ffHeader.copyWith(color: PRIMARY_COLOR),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: ConstantManager.PRIMARY_COLOR),
    );
  }


}
