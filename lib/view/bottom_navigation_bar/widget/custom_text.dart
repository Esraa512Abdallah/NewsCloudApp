import 'package:flutter/material.dart';

import '../../../helper/constans.dart';

class CustomText extends StatelessWidget {
  final String text;

  final FontWeight? fontWeight;

  final double? fontSize;

  final TextDirection? textDirection;

  final Color? color;

  final String? fontFamily;

  CustomText(
    this.text, {
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
      textDirection:
          Selectedlang == "English" ? TextDirection.ltr : TextDirection.rtl,
    );
  }
}
