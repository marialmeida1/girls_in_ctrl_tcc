import 'package:flutter/material.dart';

Widget itensInfo() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: Container(
        height: 110,
        width: 140,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('lib/assets/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget listaInfo() {
  return Container(
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        itensInfo(),
        itensInfo(),
        itensInfo(),
        itensInfo(),
        itensInfo(),
        itensInfo(),
        itensInfo(),
      ],
    ),
  );
}
