import 'package:flutter/material.dart';

Widget bottonPadrao(
  double altura,
  double? largura,
  Color color,
  Color colorBotton,
  String texto,
  BuildContext context,
  Widget? pagina,
) {
  return Container(
    alignment: Alignment.center,
    height: altura,
    width: largura,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pagina ?? const SizedBox(),
          ),
        );
      },
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
