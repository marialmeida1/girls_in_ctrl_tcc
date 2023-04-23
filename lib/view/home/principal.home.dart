import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/home/carrossel.home.dart';
import 'package:tcc_girls_in_ctrl/view/home/info.home.dart';
import 'package:tcc_girls_in_ctrl/view/menus/bottonNavigator.menus.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              ),
              infoHome(
                context,
                "Siga nosso Linkedin",
                "Veja novas vagas de emprego e projeto!",
              ),
              infoHome(
                context,
                "Vagas",
                "Ofertas de vagas na TI!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
