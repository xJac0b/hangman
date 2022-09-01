import 'package:flutter/material.dart';
import 'package:hangman/ui/constants/colors.dart';

enum AppTheme { light, dark }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
  ),
};
