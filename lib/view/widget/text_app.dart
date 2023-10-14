// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  TextUtils({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textOverflow,
  });

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    //double fontSize = MediaQuery.of(context).size.width;
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

//
// double screenWidth = MediaQuery
//     .of(context)
//     .size
//     .width;
// double textScaleFactor = screenWidth / 360;
// TextStyle baseTextStyle = TextStyle(fontSize: 16);
// TextStyle scaledTextStyle = baseTextStyle.copyWith(
//     fontSize: baseTextStyle.fontSize! * textScaleFactor);