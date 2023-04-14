import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/login/principal.login.dart';
import 'package:tcc_girls_in_ctrl/view/themes/dark.theme.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello",
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: darkTheme,
    ),
  );
}
