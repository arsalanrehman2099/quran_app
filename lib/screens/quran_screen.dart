import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran_service.dart';
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
  List quran = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    readData();
  }

  readData() async {
    var jsonData = json.decode(await QuranServices().getQuranJson());
    setState(() {
      quran = jsonData;
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
      itemCount: quran.length,
      separatorBuilder: (_, i) {
        return Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 5.0),
            child: Divider(thickness: 1.5));
      },
      itemBuilder: (ctx, i) {
        Surah surah = Surah().fromMap(quran[i]);

        return SurahItem(surah);
      },
    );
  }
}
