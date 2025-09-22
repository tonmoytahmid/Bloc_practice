import 'package:bloc_practice/config/colorConst.dart';
import 'package:flutter/material.dart';

//regular text style
TextStyle style(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

//heading text style
TextStyle headingStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: blackColor,
);

//subheading text style
TextStyle subHeadingStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: blackColor,
);
