import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/initiative.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/cards.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/listCards.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';

class PrincipalIniciativas extends StatefulWidget {
  const PrincipalIniciativas({super.key});

  @override
  State<PrincipalIniciativas> createState() => _PrincipalIniciativasState();
}

class _PrincipalIniciativasState extends State<PrincipalIniciativas> {
  TextEditingController txtSearch = TextEditingController();

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
          child: Column(
            children: [
              searchText(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 800,
                width: double.infinity,
                child: ListViewIniciativas(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
