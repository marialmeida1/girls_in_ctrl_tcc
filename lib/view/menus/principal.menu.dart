import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/menus/bottonNavigator.menus.dart';

class PrincipalMenu extends StatelessWidget {
  const PrincipalMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new NavigationBarApp(),
    );
  }
}
