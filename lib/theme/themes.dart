import 'package:app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldColorLight,
    accentColor: AppColors.blackColor, //Foreground color of most widgets
    iconTheme: IconThemeData(
      color: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.redColor,
        ),
      ),
      fillColor: AppColors.lightGreyColor,
      filled: true,
    ),
    dividerColor: AppColors.lightGreyColor,
    dividerTheme: DividerThemeData(
      thickness: 2,
    ),
    textTheme: TextTheme(
        headline1: TextStyles.black36,
        headline2: TextStyles.black32,
        headline4: TextStyles.black24,
        headline5: TextStyles.black22,
        headline6: TextStyles.black18,
        bodyText1: TextStyles.black14,
        bodyText2: TextStyles.black12),
  );
  static ThemeData darkTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldColorDark,
    accentColor: AppColors.whiteColor, //Foreground color of most widgets
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.redColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
    dividerColor: AppColors.whiteColor,
    textTheme: TextTheme(
      headline1: TextStyles.white36,
      headline2: TextStyles.white32,
      headline4: TextStyles.white24,
      headline5: TextStyles.white22,
      headline6: TextStyles.white18,
      bodyText1: TextStyles.white14,
      bodyText2: TextStyles.white12,
    ),
  );
}
