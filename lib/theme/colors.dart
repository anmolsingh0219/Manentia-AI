import 'package:flutter/material.dart';

class AppColors {
  static Color scaffoldColorDark = Color(0xff241647);
  static Color scaffoldColorLight = Color(0xffF0F0F3);
  static Color whiteColor = Colors.white;
  static Color lightGreyColor = Color(0xffe1e5ea);
  static Color greyTextColor = Color(0xff7F8489);
  static Color greyBackgroundColor = Color(0xff2F353A);
  static Color transperantColor = Colors.transparent;
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;
  static Color greyColor = Colors.grey;
  static Color greenColor = Colors.green;
  static Color blackColor65 = Colors.black.withOpacity(0.65);
  static Color blackColor54 = Colors.black.withOpacity(0.54);
  static Color orangeColor = Color(0xffF76254);
  static Color lightOrangeColor = Color(0xffF8B7B1);
  static Color purpleColor = Color(0xffD885F6);
  static Color lightPinkColor = Color(0xffffc0cb);
  static Color lightYellowColor = Color(0xffFFEAC1);
  static LinearGradient orangeGradient = LinearGradient(
      colors: [Color(0xffF76153), Color(0xffD43A2B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static LinearGradient darkBlackGradient = LinearGradient(
      colors: [Color(0xff131314), Color(0xff1D2328)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static LinearGradient blackBackgroundGradient = LinearGradient(
      colors: [Color(0xff353A40), Color(0xff16171B)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static LinearGradient whiteBackgroundGradient = LinearGradient(colors: [
    Color(0xfff6f2f2),
    Color(0xffd9d9d9),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static LinearGradient yellowGradient = LinearGradient(
      colors: [Color(0xffFFA766), Color(0xffFF8C37)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static LinearGradient greenGradient = LinearGradient(
      colors: [Color(0xff6C9F8F), Color(0xff528275)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static LinearGradient blueGradient = LinearGradient(
      colors: [Color(0xff48C8D3), Color(0xff0A96A4)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static LinearGradient redGradient = LinearGradient(
      colors: [Color(0xffFF808F), Color(0xffFF5569)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static Color shadowColorBlack1 = Color(0xff262E32);
  static Color shadowColorBlack2 = Color(0xff101012);

  static Color neuBackgroundColor = Color(0xff24272C);
  static Color neuLightColor = Color(0xff485057);
  static Color neuDarkColor = Color(0xff1F2427);
  static LinearGradient neuGradientBlack2 = LinearGradient(
    colors: [Color(0xff2F353A), Color(0xff1C1F22)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient neuGradientBlack1 = LinearGradient(
    colors: [Color(0xff24272C), Color(0xff31343C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient neuBackgroundGradient = LinearGradient(
      colors: [Color(0xff2C3036), Color(0xff31343C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static List<Color> chipColors = [
    Color(0xff8C66D8),
    Color(0xff1FA7B4),
    Color(0xffFF8C37),
    Color(0xffFF7384),
    Color(0xff609182),
  ];
}
