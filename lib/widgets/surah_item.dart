import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/screens/surah_screen.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';

class SurahItem extends StatelessWidget {
  final id;
  final name;
  final verses;
  final simpleName;
  final arabicName;
  final translatedName;

  SurahItem({this.id, this.name, this.arabicName, this.simpleName, this.verses, this.translatedName});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=> Get.to(() => SurahScreen(id,simpleName)),
      leading: CircleAvatar(
        backgroundColor: ConstantManager.PRIMARY_COLOR,
        radius: 15.0,
        child: Text(
          id.toString(),
          style: ConstantManager.ktextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        name,
        style: ConstantManager.ktextStyle.copyWith(
          color: ConstantManager.PRIMARY_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        translatedName +
            " - " +
            verses.toString() +
            ' Verses',
        style: ConstantManager.ktextStyle.copyWith(color: Colors.grey),
      ),
      trailing: Padding(
        padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal! * 3.0),
        child: Text(arabicName, style: ConstantManager.utextStyle.copyWith(
          fontSize: SizeConfig.blockSizeHorizontal! * 6.0,
        )),
      ),
    );
  }
}
