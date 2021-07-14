import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_final/shared/styles/colors.dart';

// Dark theme
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  accentColor: Colors.white,
  fontFamily: "Janna",
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ),
    elevation: 5,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    backgroundColor: Colors.white,
    elevation: 20,
    unselectedItemColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

// Light theme
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: primaryColor,
  accentColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Janna",
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    backgroundColor: Colors.white,
    elevation: 20,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  buttonTheme: ButtonThemeData(
    splashColor: primaryColor,
    buttonColor: primaryColor,     //  <-- dark color
    textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
);
