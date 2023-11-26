import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle modifiedTextStyle(
    {required fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color}) {
  return GoogleFonts.rubik(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle appBarTitleTextStyle({
  double fontSize = 24.0,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return GoogleFonts.adventPro(fontSize: fontSize, fontWeight: fontWeight);
}
