import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/screens/surah_screen.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';

class SurahItem extends StatelessWidget {
  final Surah _surah;

  SurahItem(this._surah);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => SurahScreen(_surah)),
      leading: CircleAvatar(
        backgroundColor: ConstantManager.PRIMARY_COLOR,
        radius: 15.0,
        child: Text(
          _surah.id.toString(),
          style: ConstantManager.ffEnglish.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        _surah.transliteration ?? "",
        style: ConstantManager.ffEnglish.copyWith(
          color: ConstantManager.PRIMARY_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${_surah.total_verses.toString()} Verses",
        style: ConstantManager.ffEnglish.copyWith(color: Colors.grey),
      ),
      trailing: Text("سورة ${_surah.name ?? ""}",
          style: ConstantManager.ffUrdu.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 6.0,
          )),
    );
  }
}
