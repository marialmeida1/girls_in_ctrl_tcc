import 'package:flutter/material.dart';

Widget bottonPadrao(double altura, double? largura, Color color, String texto,
    BuildContext context) {
  return Container(
    height: altura,
    width: largura,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    ),
    child: Text(
      texto,
      style: Theme.of(context).textTheme.headline2?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
      textAlign: TextAlign.center,
    ),
  );
}
