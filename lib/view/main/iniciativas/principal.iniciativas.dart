import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/cards.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';

class PrincipalIniciativas extends StatefulWidget {
  const PrincipalIniciativas({Key? key}) : super(key: key);

  @override
  _PrincipalIniciativasState createState() => _PrincipalIniciativasState();
}

class _PrincipalIniciativasState extends State<PrincipalIniciativas> {
  List<CardsIniciativas> allIniciativas = [
    CardsIniciativas(
      card: '1',
      name: "Reprograma",
      subtitle: "Site Web",
      link: 'https://reprograma.com.br',
      image: 'lib/assets/reprograma.png',
    ),
    CardsIniciativas(
      card: '2',
      name: "Developer Girls",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/developergirls_/',
      image: 'lib/assets/devgirls.png',
    ),
    CardsIniciativas(
      card: '3',
      name: "Developer Girls",
      subtitle: "Site Web",
      link: 'https://www.developergirls.com.br/home',
      image: 'lib/assets/devgirls.png',
    ),
    CardsIniciativas(
      card: '4',
      name: "Mulheres Positivas",
      subtitle: "Site Web",
      link: 'https://mulherespositivas.com.br/',
      image: 'lib/assets/mulherespositivaslogo.jpg',
    ),
    CardsIniciativas(
      card: '5',
      name: "BitGirls",
      subtitle: "Site Web",
      link: 'http://www.bitgirls.dcc.ufmg.br/index.html',
      image: 'lib/assets/bitgirls.png',
    ),
    CardsIniciativas(
      card: '6',
      name: "Meninas Digitais",
      subtitle: "Site Web",
      link: 'https://meninas.sbc.org.br/',
      image: 'lib/assets/meninasdigitais.png',
    ),
    CardsIniciativas(
      card: '7',
      name: "Include <gurias>",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/include.gurias/',
      image: 'lib/assets/includegurias.png',
    ),
    CardsIniciativas(
      card: '8',
      name: "Include <meninas.uff>",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/includemeninas/',
      image: 'lib/assets/includemeninasuff.png',
    ),
    CardsIniciativas(
      card: '8',
      name: "Elas@Computação",
      subtitle: "Site Web",
      link: 'https://elas.computacao.ufcg.edu.br/',
      image: 'lib/assets/elas@computação.png',
    ),
    CardsIniciativas(
      card: '9',
      name: "Cintia",
      subtitle: "Site Web",
      link: 'https://sites.google.com/cin.ufpe.br/cintia/in%C3%ADcio',
      image: 'lib/assets/cintia.png',
    ),
    CardsIniciativas(
      card: '10',
      name: "Code Rosa",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/coderosatecnologia/',
      image: 'lib/assets/coderosa.jpg',
    ),
    CardsIniciativas(
      card: '11',
      name: "Computer Science Girls",
      subtitle: "Site Web",
      link: 'https://csgirls.org/',
      image: 'lib/assets/computersciencegirls.png',
    ),
    CardsIniciativas(
      card: '12',
      name: "Cunhantã Digital",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/cunhantadigital/',
      image: 'lib/assets/cunhantãdigital.png',
    ),
    CardsIniciativas(
      card: '13',
      name: "Ei Mana!",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/eimana_icet/',
      image: 'lib/assets/eimana.jpg',
    ),
    CardsIniciativas(
      card: '14',
      name: "Elas Digitais",
      subtitle: "Site Web",
      link: 'https://elasdigitais.wordpress.com/',
      image: 'lib/assets/elasdigitais.png',
    ),
    CardsIniciativas(
      card: '15',
      name: "Elas++",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/elasmaismais/',
      image: 'lib/assets/elas++.png',
    ),
    CardsIniciativas(
      card: '16',
      name: "Emíli@s",
      subtitle: "Site Web",
      link: 'https://utfpr.curitiba.br/emilias/',
      image: 'lib/assets/emili@s.png',
    ),
    CardsIniciativas(
      card: '17',
      name: "Emíli@s",
      subtitle: "Perfil Instagram",
      link: 'https://emilias.dainf.ct.utfpr.edu.br/',
      image: 'lib/assets/emili@s.png',
    ),
    CardsIniciativas(
      card: '18',
      name: "Garotas Tech",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/gatech/',
      image: 'lib/assets/gatech.jpg',
    ),
    CardsIniciativas(
      card: '19',
      name: "GECET",
      subtitle: "Site Web",
      link: 'https://www.viser.com.br/gecet',
      image: 'lib/assets/gecet.jpg',
    ),
    CardsIniciativas(
      card: '20',
      name: "Girls'n Code",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/_gatech/',
      image: "lib/assets/girls'ncode.png",
    ),
    CardsIniciativas(
      card: '21',
      name: "Girls Who Code",
      subtitle: "Site Web",
      link: 'https://girlswhocode.com/',
      image: 'lib/assets/girlswhocode.png',
    ),
    CardsIniciativas(
      card: '22',
      name: "GRACE",
      subtitle: "Site Web",
      link: 'http://each.uspnet.usp.br/petsi/grace/',
      image: 'lib/assets/grace.png',
    ),
    CardsIniciativas(
      card: '23',
      name: "Igualdade STEM",
      subtitle: "Site Web",
      link: 'https://www.igualdadestem.com/',
      image: 'lib/assets/igualdadestem.png',
    ),
    CardsIniciativas(
      card: '24',
      name: "InfoGirl",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/infogirlufc/',
      image: 'lib/assets/infogirl.png',
    ),
    CardsIniciativas(
      card: '25',
      name: "ItGirls",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/itgirlsrt/',
      image: 'lib/assets/itgirls.jpg',
    ),
    CardsIniciativas(
      card: '26',
      name: "Minas Programam",
      subtitle: "Site Web",
      link: 'https://minasprogramam.com/',
      image: 'lib/assets/minasprogramam.jpg',
    ),
    CardsIniciativas(
      card: '27',
      name: "Gamt",
      subtitle: "Site Web",
      link: 'https://www.gamt.org.br/quem-somos',
      image: 'lib/assets/gamt.png',
    ),
    CardsIniciativas(
      card: '28',
      name: "Progra{m}aria",
      subtitle: "Site Web",
      link: 'https://www.programaria.org/',
      image: 'lib/assets/programaria.png',
    ),
    CardsIniciativas(
      card: '29',
      name: "WoMakersCode",
      subtitle: "Site Web",
      link: 'https://womakerscode.org/',
      image: 'lib/assets/womakerscode.jpg',
    ),
    CardsIniciativas(
      card: '30',
      name: "PyLadies",
      subtitle: "Site Web",
      link: 'https://pyladies.com/',
      image: 'lib/assets/pyladies.png',
    ),
    CardsIniciativas(
      card: '31',
      name: "DjangoGirls",
      subtitle: "Site Web",
      link: 'https://djangogirls.org/pt-br/',
      image: 'lib/assets/djangogirls.png',
    ),
    CardsIniciativas(
      card: '32',
      name: "We Ventures",
      subtitle: "Site Web",
      link: 'https://www.we.ventures/',
      image: 'lib/assets/weventures.png',
    ),
    CardsIniciativas(
      card: '33',
      name: "Tech Ladies Brasil",
      subtitle: "Perfil Instagram",
      link: 'https://www.instagram.com/techladiesbr/',
      image: 'lib/assets/techladies.jpg',
    ),
    CardsIniciativas(
      card: '34',
      name: "Rails Girls",
      subtitle: "Site Web",
      link: 'https://railsgirls.com/',
      image: 'lib/assets/railsgirls.jpg',
    ),
  ];

  List<CardsIniciativas> searchResults = [];

  void performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        // Se o campo de pesquisa estiver vazio, exibe todos os resultados
        searchResults = [];
      } else {
        // Caso contrário, filtra os resultados com base no nome das iniciativas
        searchResults = allIniciativas
            .where((iniciativa) =>
                iniciativa.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool loading = true;

    return Scaffold(
      appBar: myappBar(
        context,
        Colors.black,
        "Iniciativas",
        "Projetos de para mulheres na área de TI!",
        null,
        null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchText(performSearch),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView
                shrinkWrap: true,
                itemCount: searchResults.isNotEmpty
                    ? searchResults.length
                    : allIniciativas.length,
                itemBuilder: (context, index) {
                  final iniciativa = searchResults.isNotEmpty
                      ? searchResults[index]
                      : allIniciativas[index];
                  return iniciativa;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
