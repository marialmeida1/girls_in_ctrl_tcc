import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/carrossel.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/info.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/listaInfo.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/noticias/cards.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/noticia/cards.noticia.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: myappBar(
        context,
        Colors.white,
        null,
        null,
        null,
        null,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Carrossel(),
              const SizedBox(
                height: 24,
              ),
              infoHome(
                context,
                "Siga nosso Instagram",
                "Veja informações sobre a tecnologia!",
                null,
                listaInfo(),
                110,
                200,
              ),
              infoHome(
                context,
                "Siga nosso Linkedin",
                "Veja novas vagas de emprego e projeto!",
                Color.fromARGB(14, 0, 0, 0),
                listaInfo(),
                110,
                200,
              ),
              infoHome(
                context,
                "Notícias",
                "As principais notícias sobre tecnologia!",
                null,
                CardsNewsHome(),
                235,
                315,
              ),
              infoHome(
                context,
                "Siga nosso Linkedin",
                "Veja novas vagas de emprego e projeto!",
                Color.fromARGB(14, 0, 0, 0),
                listaInfo(),
                110,
                200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
