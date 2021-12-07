
import 'package:flutter/services.dart' show rootBundle;


class QuranServices {
  static const QURAN_JSON_PATH = 'assets/files/quran.json';


  Future<String> getQuranJson() {
    return rootBundle.loadString(QURAN_JSON_PATH);
  }


}
