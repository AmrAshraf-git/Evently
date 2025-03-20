import 'package:evently_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme{
static final ThemeData light = ThemeData(
  appBarTheme: AppBarTheme(

    centerTitle: true,
    scrolledUnderElevation: 0,
  ),
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary
  )),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        textStyle: TextStyle(fontSize: 20),
        //elevation: 1,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ))
);

static final ThemeData dark = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
);

}