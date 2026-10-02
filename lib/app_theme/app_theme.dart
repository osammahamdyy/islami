import 'package:flutter/material.dart';
import 'app_colors.dart';


abstract class AppTheme {
  AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.black_color,
    foregroundColor: AppColors.gold_color,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'jannalt',
      color: AppColors.gold_color,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      
    ),
  );
  static ThemeData app_theme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF202020),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE2BE7F)),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black_color,
      foregroundColor: AppColors.gold_color,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'jannalt',
        color: AppColors.gold_color,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        
      ),
    ),
  );
}
