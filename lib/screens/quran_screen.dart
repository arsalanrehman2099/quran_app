import 'package:flutter/material.dart';
import 'package:quran_app/services/quran_api.dart';
import 'package:quran_app/utils/constant_manager.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:quran_app/widgets/circular_loader.dart';
import 'package:quran_app/widgets/surah_item.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  List surahs = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    readData();
  }

  readData() async {
    final response = await QuranApi.fetchChapters();

    setState(() {
      surahs = response['chapters'];
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: ConstantManager.kAppbar('The Holy Quran'),
      backgroundColor: Colors.white,
      body: _loading ? CircularLoader() : surahListView(),
    );
  }

  Widget surahListView() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!),
      itemCount: surahs.length,
      separatorBuilder: (_, i) {
        return Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 5.0),
            child: Divider(thickness: 1.5));
      },
      itemBuilder: (ctx, i) {
        return SurahItem(
          id: surahs[i]['id'],
          name: surahs[i]['name_complex'],
          simpleName:  surahs[i]['name_simple'],
          arabicName: surahs[i]['name_arabic'],
          verses: surahs[i]['verses_count'],
          translatedName:  surahs[i]['translated_name']['name'],
        );
      },
    );
  }
}
