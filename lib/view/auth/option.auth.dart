import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/view/auth/cadastrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/auth/entrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';

class OptionScreem extends StatelessWidget {
  const OptionScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoTop(),
            Option(context),
          ],
        ),
      ),
    );
  }
}

Widget LogoTop() {
  return Container(
    height: 300,
    child: Center(
      child: Image.asset(
        "lib/assets/logoSplash.png",
        height: 120,
      ),
    ),
  );
}

Widget Option(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.6,
    decoration: BoxDecoration(
      color: Color(0xffa17bff),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 4,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 80,
        bottom: 80,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bem vinda!",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Seja bem-vinda ao app do Girls in Crtl! Para que consiga ter uma boa experiência no nosso aplicativo peço que entre ou realize o cadastro! Aproveite a experiência!",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 60,
          ),
          Bottons(context),
        ],
      ),
    ),
  );
}

Widget Bottons(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: bottonPadrao(
              50,
              null,
              Colors.white,
              Colors.black,
              "Entrar",
              context,
              const TelaEntrar(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: bottonPadrao(
              50,
              null,
              Colors.black,
              Colors.white,
              "Cadastrar",
              context,
              const TelaCadastrar(),
            ),
          ),
        )
      ],
    ),
  );
}
