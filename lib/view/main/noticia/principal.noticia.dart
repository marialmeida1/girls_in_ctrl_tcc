import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';

class PrincipalNoticias extends StatelessWidget {
  const PrincipalNoticias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        context,
        Colors.black,
        "Notícias",
        "Tudo sobre o mundo da tecnologia!",
        null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: Container(
          child: searchText(),
        ),
      ),
    );
  }
}
