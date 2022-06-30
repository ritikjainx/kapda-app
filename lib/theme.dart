import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

ThemeData themeData() {
  var textTheme = const TextTheme(bodyText1: TextStyle(color: kTextColor), bodyText2: TextStyle(color: kTextColor));

  return ThemeData(
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    textTheme: textTheme,
  );
}

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 2,
  iconTheme: IconThemeData(color: Colors.black),
  toolbarTextStyle: TextTheme(headline6: TextStyle(color: Color(0xff8d8d8d), fontSize: 18)).bodyText2,
  titleTextStyle: TextTheme(headline6: TextStyle(color: Color(0xff8d8d8d), fontSize: 18)).headline6,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30), gapPadding: 10, borderSide: const BorderSide(color: kTextColor));
  return InputDecorationTheme(
      labelStyle: const TextStyle(color: kTextColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}
