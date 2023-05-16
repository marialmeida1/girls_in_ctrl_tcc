import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/listaInfo.home.dart';

Widget infoHome(context, titulo, subtitulo, Color? color) {
  return Container(
    color: color,
    height: 200,
    width: double.infinity,
    padding: const EdgeInsets.only(
      left: 32,
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          alignment: Alignment.centerLeft,
          height: 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                subtitulo,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 110,
          child: listaInfo(),
        )
      ],
    ),
  );
}
