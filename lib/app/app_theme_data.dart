import 'package:ecommerce/app/app_color.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor
      )
    );
  }
  static ThemeData get darkThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black45,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor
      )
    );
  }
}