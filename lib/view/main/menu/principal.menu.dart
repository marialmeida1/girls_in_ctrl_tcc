import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/tabBar.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';

class PrincipalMenu extends StatelessWidget {
  const PrincipalMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: DefaultTabController(
        length: 4,
        child: TabsPage(),
      ),
    );
  }
}
