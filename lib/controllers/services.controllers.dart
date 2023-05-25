import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/gets.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import "package:http/http.dart" as http;
import 'package:tcc_girls_in_ctrl/models/user.models.dart';

// ------ Login ------
Future<ApiResponse> login(String email, String password) async {
  // Conecta com o modelo de objeto da Api Response
  ApiResponse apiResponse = ApiResponse();

  try {
    // Utiliza o http do dart para poder se conectar com a rota da API em Laravel
    // Utiliza o método post, como é pedido pela rota
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    // O "response" envia uma resposta que será analizada de acordo com os requisitos pedidos
    switch (response.statusCode) {

      // Deu certo
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;

      // Quando há problemas com a conexão
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.key.elementAt(0)[0]];
        break;

      // Problemas relacionados ao cadastro
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;

      // Nenhuma das alternativas acima
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    // Erro no servidor
    apiResponse.error = serverError;
  }

  return apiResponse;
}

// ------ Register ------
Future<ApiResponse> register(
    String name, String lastname, String email, String password) async {
  // Pega mais variáveis que o login e utiliza uma rota diferente, que dessa vez vai registrar os valores
  // Da os mesmos erros que o login

  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'password_confirmation': password
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// ------ User ------
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// ------ Update ------
Future<ApiResponse> update(String name, String lastname, String? image) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.put(Uri.parse(userURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },

        // há duas abordagens, caso tenha o recebimento de imagem ou não
        // se NÃO tem, irá executar somente o nome
        // se tem irá executar o nome e a imagem
        body: image == null
            ? {
                'name': name,
              }
            : {'name': name, 'lastname': lastname, 'image': image});

    // isso fica armazenado em "response" e é verificado so agora
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// ------ Logout ------
Future<bool> logout() async {
  // O sharedPrederences que armazenou as ultimas informções é utilizado como verificação para remoção do token de login
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

Future<ApiResponse> logoutUser() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.post(
      Uri.parse(logoutURl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // isso fica armazenado em "response" e é verificado so agora
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
