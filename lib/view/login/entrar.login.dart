import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/login/cadastrar.login.dart';
import 'package:tcc_girls_in_ctrl/view/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/menus/principal.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/textBox.widgets.dart';

class TelaEntrar extends StatelessWidget {
  const TelaEntrar({super.key});

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
                      const SizedBox(
                        height: 40,
                      ),
                      textBox("Email"),
                      const SizedBox(
                        height: 26,
                      ),
                      textBox("Senha"),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 20,
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Esqueceu sua senha?",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      bottonPadrao(
                        50,
                        double.infinity,
                        Colors.black,
                        Colors.white,
                        "Entrar",
                        context,
                        PrincipalMenu(),
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
