import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/entrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/text.widgets.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      lastnameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  // Validação de registros
  void _registerUser() async {
    // Pega valores inseridos e envia para a função register
    ApiResponse response = await register(
      nameController.text,
      lastnameController.text,
      emailController.text,
      passwordController.text,
    );

    // Salva ou não valores temporários
    if (response.error == null) {
      _saveAndRedirect(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Salva o id e token temporariamente
  void _saveAndRedirect(User user) async {
    // Pega os valores do usuário temposáriamente
    SharedPreferences pref = await SharedPreferences.getInstance();

    // Salva os valores de id e token
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);

    // Remove rotas anteriores e envia para a nova página
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Principal()), (route) => false);
  }

  String? Function(String?) validatorName =
      (val) => val!.isEmpty ? 'Nome inválido' : null;

  String? Function(String?) validatorLastName =
      (val) => val!.isEmpty ? 'Nome inválido' : null;

  String? Function(String?) validatorEmail =
      (val) => val!.isEmpty ? 'Email inválido' : null;

  String? Function(String?) validatorPassword =
      (val) => val!.length < 6 ? 'Requer 6 caractéres' : null;

  void _button() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        _registerUser();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Entrar',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaEntrar()),
              );
            },
          ),
        ),
      ),
      body: Container(
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
              height: 150,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cadastrar",
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
            Expanded(
              child: Container(
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
                      textBox(
                        "Nome",
                        nameController,
                        null,
                        validatorName,
                        false,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      textBox(
                        "Último Nome",
                        lastnameController,
                        null,
                        validatorLastName,
                        false,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      textBox(
                        "Email",
                        emailController,
                        TextInputType.emailAddress,
                        validatorEmail,
                        false,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      textBox(
                        "Senha",
                        passwordController,
                        null,
                        validatorName,
                        true,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      textBox(
                        "Confirmação Senha",
                        passwordConfirmController,
                        null,
                        validatorName,
                        true,
                      ),
                      const SizedBox(
                        height: 15,
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
                              "Cadastrar",
                              context,
                              _button,
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
