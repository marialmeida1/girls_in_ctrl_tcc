import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/cards.iniciativas.dart';

class ListViewIniciativas extends StatelessWidget {
  const ListViewIniciativas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardsIniciativas(
          card: '1',
          name: "Reprograma",
          subtitle: "Site Web",
          link: 'https://reprograma.com.br  ',
          image: 'lib/assets/reprograma.png',
        ),
        const SizedBox(height: 16),
        CardsIniciativas(
          card: '2',
          name: "Developer Girls",
          subtitle: "Perfil Instagram",
          link: 'https://instagram.com/developergirls_?utm_medium=copy_link',
          image: 'lib/assets/devgirls.png',
        ),
        const SizedBox(height: 16),
        CardsIniciativas(
          card: '3',
          name: "Developer Girls",
          subtitle: "Site Web",
          link: 'https://wwww.developergirls.com.br/home',
          image: 'lib/assets/devgirls.png',
        )
      ],
    );
  }
}
