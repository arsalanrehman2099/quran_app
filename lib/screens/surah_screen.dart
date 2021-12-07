import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';

class SurahScreen extends StatelessWidget {
  final Surah _surah;

  SurahScreen(this._surah);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: kAppbar(" سورة${_surah.name}"),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 5.0,
              vertical: SizeConfig.blockSizeVertical! * 2.0),
          itemCount: _surah.verses?.length ?? 0,
          separatorBuilder: (_, i) => Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical! * 2.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          itemBuilder: (ctx, i) {
            var verse = _surah.verses?[i];

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.0,
                    child: Text(
                      verse['id'].toString(),
                      style: ConstantManager.ffEnglish
                          .copyWith(color: ConstantManager.PRIMARY_COLOR),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 1.5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        verse['text'],
                        textAlign: TextAlign.right,
                        style: ConstantManager.ffArabic.copyWith(
                          color: ConstantManager.PRIMARY_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal! * 8.5,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  // default app bar
  kAppbar(text) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("سورة ${_surah.name ?? ""}",
          style: ConstantManager.ffUrdu.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 6.5,
            color: ConstantManager.PRIMARY_COLOR,
          )),
      centerTitle: true,
      iconTheme: IconThemeData(color: ConstantManager.PRIMARY_COLOR),
    );
  }
}
