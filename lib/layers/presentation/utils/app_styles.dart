import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color blueColor = const Color(0xFF526799);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color orangeColor2 = const Color(0xFFFF7B2C);
  static Color lightGrey = const Color(0xFFC0C0CF);
  static Color greyColor = const Color(0xFF8E8EA9);
  static Color yellowColor = const Color(0xFFFFB01D);
  static Color blackColor2 = const Color(0xFF32324D);
  static Color darkGreyColor = const Color(0xFF666687);
  static Color buttonColor = const Color(0xFF615793);
  static Color buttonSplahColor = const Color(0xFF8981AE);

  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
      TextStyle(fontSize: 26, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 22, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle productNameStyle =
      TextStyle(fontSize: 22, color: blackColor2, fontWeight: FontWeight.w600);
  static TextStyle productPriceStyle =
      TextStyle(fontSize: 20, color: orangeColor2, fontWeight: FontWeight.w600);

  static TextStyle tabButtonS = TextStyle(
    color: white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle tabButtonU = TextStyle(
    color: greyColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
