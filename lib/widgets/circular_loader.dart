import 'package:flutter/material.dart';
import 'package:quran_app/utils/constant_manager.dart';

class CircularLoader extends StatelessWidget {

  Color color;


  CircularLoader({this.color = ConstantManager.PRIMARY_COLOR});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}