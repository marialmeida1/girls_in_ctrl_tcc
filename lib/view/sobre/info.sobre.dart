import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: Center(
            child: Text(
              "O aplicativo se trata sobre o Trabalho de Conclusão de Curso, Girls in Ctrl. Um projeto que pretende ser uma comunidade para garotas na área de tecnologia, ofertando apoio, vagas de emprego, cursos e iniciativas já existentes. Este protótipo apresenta algumas telas as quais vão estar presentes na conclusão final, dentre elas, as de entrada e cadastro, como a principal. Pode-se observar que na principal não há nenhuma funcionalidade, visto que, grande parte delas funcionará via API, projeto ainda que não foi concluído",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                  ),
              textAlign: TextAlign.justify,
            ),
          ),
        ));
  }
}
