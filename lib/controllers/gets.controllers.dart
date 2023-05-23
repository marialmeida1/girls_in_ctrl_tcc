import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

// ------ Get Token ------
// Pega dados de uma instancia e armazena temporáriamente no aplicativo
Future<String> getToken() async {
  // Pega diversos dados
  SharedPreferences pref = await SharedPreferences.getInstance();
  // Busca somente um resultado
  return pref.getString('token') ?? '';
}

// ------ Get Id ------
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('token') ?? 0;
}

// ------ Get Image String ------
String? getStringImage(File? file) {
  // Verifica se é nulo
  if (file == null) return null;

  // Se não for nulo, retorna uma string codificada
  return base64Encode(file.readAsBytesSync());
}
