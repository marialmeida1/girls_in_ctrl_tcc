import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/splash.view.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello",
      debugShowCheckedModeBanner: false,
      home: const Loading(),
      theme: lightTheme,
    ),
  );
}
