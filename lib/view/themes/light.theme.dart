import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(0xffa17bff, {
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
    }),
    backgroundColor: const Color(0xfff5f5f5),
    brightness: Brightness.light,
  ).copyWith(
    secondary: const Color(0xfff5f5f5),
  ),
);
