import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/principal.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/noticia/principal.noticia.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/principal.profile.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          Principal(),
          const PrincipalNoticias(),
          const PrincipalIniciativas(),
          const PrincipalProfile()
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(
            icon: Icon(Icons.home_outlined),
          ),
          Tab(
            icon: Icon(Icons.newspaper_outlined),
          ),
          Tab(
            icon: Icon(Icons.lightbulb_outlined),
          ),
          Tab(
            icon: Icon(Icons.person_outline),
          ),
        ],
        labelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
