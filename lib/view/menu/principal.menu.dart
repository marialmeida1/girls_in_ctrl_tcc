import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/menu/carrossel.menu.dart';

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
        child: Column(
          children: [
            Carrossel(),
            const SizedBox(
              height: 24,
            ),
            SigaInstagram(),
          ],
        ),
      ),
    );
  }
}

Widget SigaInstagram() {
  return Container(
    height: 200,
    color: Colors.red,
    width: double.infinity,
    padding: const EdgeInsets.only(
      right: 32,
      left: 32,
    ),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Siga nosso Instagram",
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Tenha acesso aos conteúdos atualizados",
                textAlign: TextAlign.end,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
