import 'package:flutter/material.dart';

typedef TapCallback = void Function();

Widget bottonPadrao(
  double altura,
  double? largura,
  Color color,
  Color colorBotton,
  String texto,
  BuildContext context,
  TapCallback? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: altura,
      width: largura,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Text(
        texto,
        style: Theme.of(context).textTheme.headline2?.copyWith(
              color: colorBotton,
            ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
