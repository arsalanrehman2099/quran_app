import 'package:flutter/material.dart';
import 'package:quran_app/services/quran_api.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:quran_app/widgets/circular_loader.dart';

class SurahScreen extends StatefulWidget {

  int id;
  String name;

  SurahScreen(this.id, this.name);

  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {

  var verses = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchSurah();
  }

  fetchSurah() async{
    final response = await QuranApi.fetchSurah(widget.id);

    setState(() {
      verses = response['data']['verses'];
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantManager.kAppbar("Surah ${widget.name}"),
      body: _loading ? CircularLoader() :  ListView.separated(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 5.0,
            vertical: SizeConfig.blockSizeVertical! * 2.0),
        itemCount: verses.length,
        separatorBuilder: (_, i) => Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical! * 2.0),
          child: Divider(
            thickness: 1.5,
          ),
        ),
        itemBuilder: (ctx, i) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16.0,
                  child: Text(
                    verses[i]['number']['inSurah'].toString(),
                    style: ConstantManager.ktextStyle.copyWith(color: ConstantManager.PRIMARY_COLOR),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 1.5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    verses[i]['text']['arab'],
                    textAlign: TextAlign.right,
                    style: ConstantManager.utextStyle.copyWith(
                      color: ConstantManager.PRIMARY_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal! * 8.0,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 1.5),
                Text(
                  verses[i]['translation']['en'],
                  textAlign: TextAlign.left,
                  style: ConstantManager.ktextStyle.copyWith(
                      color: ConstantManager.PRIMARY_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.0),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
