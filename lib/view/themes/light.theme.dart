import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xffa17bff,
      <int, Color>{
        50: Color(0xffe9e6ff),
        100: Color(0xffc9c1ff),
        200: Color(0xffa99aff),
        300: Color(0xff8973ff),
        400: Color(0xff704fff),
        500: Color(0xff583bff),
        600: Color(0xff4f32e6),
        700: Color(0xff3f28b4),
        800: Color(0xff2f1e81),
        900: Color(0xff1f144e),
      },
    ),
    backgroundColor: const Color(0xfff5f5f5),
    brightness: Brightness.light,
  ).copyWith(
    secondary: const Color(0xfff5f5f5),
  ),
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      headline2: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      )),
);

double size(BuildContext context, double valor) {
  final Size screenSize = MediaQuery.of(context).size;
  final double screenHeight = screenSize.height;
  return screenHeight * valor;
}
