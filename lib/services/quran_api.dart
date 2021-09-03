import 'dart:convert';

import 'package:http/http.dart' as http;

class QuranApi {
  static const BASE_URL = 'https://api.quran.com/';
  static const CHAPTERS_ENDPOINT = 'api/v4/chapters';

  static const SURAH_URL = 'https://api.quran.sutanlab.id/surah/';

  static fetchChapters() async {
    final url = Uri.parse(BASE_URL + CHAPTERS_ENDPOINT);
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  static fetchSurah(id) async {
    var url = Uri.parse(SURAH_URL + id.toString());
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
