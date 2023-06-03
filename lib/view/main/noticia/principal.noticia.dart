import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/noticia/cards.noticia.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipalNoticias extends StatefulWidget {
  const PrincipalNoticias({super.key});

  @override
  State<PrincipalNoticias> createState() => _PrincipalNoticiasState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _PrincipalNoticiasState extends State<PrincipalNoticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        context,
        Colors.black,
        "Notícias",
        "Tudo sobre o mundo da tecnologia!",
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
          child: CardsNoticias(),
        ),
      ),
    );
  }
}
