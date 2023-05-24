import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/cadastrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/principal.menu.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/text.widgets.dart';

import '../../controllers/services.controllers.dart';

class TelaEntrar extends StatefulWidget {
  const TelaEntrar({super.key});

  @override
  State<TelaEntrar> createState() => _TelaEntrarState();
}

class _TelaEntrarState extends State<TelaEntrar> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  // Responsável por verificar o login
  void _loginUser() async {
    // Conecta com a função "login" em "services" e pega um resposta do que é enviado
    ApiResponse response = await login(txtEmail.text, txtPassword.text);

    // Se não há erros manda para salvar token
    if (response.error == null) {
      // Envia informação para a função
      _saveAndRedirect(response.data as User);
    }
    // Se der erro para o loading e coloca um resposta como erro
    else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Salva informações temporárias (id e token)
  void _saveAndRedirect(User user) async {
    // Guarda as informações temporáriamente
    SharedPreferences pref = await SharedPreferences.getInstance();

    // Salva no "SharedPrederences" o id e o token do usuário
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);

    // Envia para uma nova rota e exclui as rotas anteriores usadas, como login e registro, impedindo do usuário voltar
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Principal()), (route) => false);
  }

  String? Function(String?) validatorEmail =
      (val) => val!.isEmpty ? 'Email inválido' : null;

  String? Function(String?) validatorPassword =
      (val) => val!.length < 6 ? 'Requer 6 caractéres' : null;

  void _button() {
    if (formkey.currentState!.validate()) {
      setState(() {
        loading = true;
        _loginUser();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        toolbarHeight: 60,
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: InkWell(
            child: Text(
              'Cadastrar',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaCadastrar()),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                ),
                height: size(context, 0.2),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Entrar",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Olá Girl, que bom ter você aqui!",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: size(context, 0.8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  textBox(
                                    "Email",
                                    txtEmail,
                                    TextInputType.emailAddress,
                                    validatorEmail,
                                    false,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  textBox(
                                    "Senha",
                                    txtPassword,
                                    null,
                                    validatorPassword,
                                    true,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 20,
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Esqueceu sua senha?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            loading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : bottonPadrao(
                                    50,
                                    double.infinity,
                                    Colors.black,
                                    Colors.white,
                                    "Entrar",
                                    context,
                                    _button,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
