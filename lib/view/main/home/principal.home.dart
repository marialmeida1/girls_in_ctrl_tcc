import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/carrossel.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/info.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';

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
              ),
              infoHome(
                context,
                "Siga nosso Linkedin",
                "Veja novas vagas de emprego e projeto!",
                Color.fromARGB(14, 0, 0, 0),
              ),
              infoHome(
                context,
                "Vagas",
                "Ofertas de vagas na TI!",
                null,
              ),
              infoHome(
                context,
                "Vagas",
                "Ofertas de vagas na TI!",
                Color.fromARGB(14, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
