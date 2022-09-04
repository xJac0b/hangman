import 'package:flutter/material.dart';
import 'package:hangman/ui/constants/colors.dart';

enum AppTheme { light, dark }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color.fromARGB(255, 227, 227, 227),
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Color.fromARGB(193, 255, 255, 255))),
    primaryColor: Colors.black,
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
  ),
};
