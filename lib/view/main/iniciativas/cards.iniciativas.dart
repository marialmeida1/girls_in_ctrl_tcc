import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/initiative.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';

class CardsIniciativas extends StatelessWidget {
  final String card;
  final String name;
  final String subtitle;
  final String link;
  final String image;

  CardsIniciativas({
    required this.card,
    required this.name,
    required this.subtitle,
    required this.link,
    required this.image,
  });

  void registerInitiative(String card, String name, String link) async {
    ApiResponse response = await initiative(card, name, link);

    if (response.error == null) {
      // Iniciativa adicionada ou atualizada com sucesso
      Initiative initiative = response.data as Initiative;
      // Faça o que for necessário com os dados da iniciativa
      print(
          'ID: ${initiative.card}, Nome: ${initiative.name}, Link: ${initiative.link}');
    } else {
      // Lidar com erros
      print('Erro: ${response.error}');
    }
  }

  @override
  Widget build(BuildContext context) {
    registerInitiative(card, name, link);

    print(card);
    print(name);
    print(link);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20), // Ajuste o valor do raio desejado
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        onTap: () {},
        leading: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 12,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black45,
        ),
      ),
    );
  }
}
