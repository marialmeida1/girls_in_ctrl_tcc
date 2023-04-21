import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/textBox.widgets.dart';

class TelaEntrar extends StatelessWidget {
  const TelaEntrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 80,
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Enim dolore id officia est reprehenderit culpa. Ut aliquip enim ullamco proident ipsum.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
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
                          "Forget your Password?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      bottonPadrao(
                        50,
                        double.infinity,
                        Theme.of(context).colorScheme.primary,
                        Colors.white,
                        "Entrar",
                        context,
                        null,
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
