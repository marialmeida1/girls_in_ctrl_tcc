import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';

class PrincipalIniciativas extends StatelessWidget {
  const PrincipalIniciativas({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = true;

    return Scaffold(
      appBar: myappBar(
        context,
        Colors.black,
        "Iniciativas",
        "Projetos de para mulheres na área de TI!",
        null,
        null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            searchText(),
          ]),
        ),
      ),
    );
  }
}
