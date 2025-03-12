import 'package:evently_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme{
static final ThemeData light = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary
  ))
);

static final ThemeData dark = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
);

}