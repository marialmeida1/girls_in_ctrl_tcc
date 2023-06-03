import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsNoticias extends StatefulWidget {
  const CardsNoticias({super.key});

  @override
  State<CardsNoticias> createState() => _CardsNoticiasState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _CardsNoticiasState extends State<CardsNoticias> {
  List<dynamic> noticias = [];
  List<dynamic> filteredNoticias = [];

  void initState() {
    super.initState();
    fetchNoticias().then((data) {
      setState(() {
        noticias = data;
        filteredNoticias = noticias;
      });
    });
  }

  void search(value) {
    setState(() {
      filteredNoticias = noticias.where((newsItem) {
        final title = newsItem['title'] ?? '';
        // Filtrar com base no título ou na descrição da notícia
        return title.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchText(search),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<dynamic>>(
          future: fetchNoticias(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView
                shrinkWrap: true,
                itemCount: filteredNoticias.length,
                itemBuilder: (context, index) {
                  final newsItem = filteredNoticias[index];
                  return Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
                          // Ajuste o valor do raio desejado
                        ),
                        child: GestureDetector(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tileColor: Colors.transparent,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            onTap: () {
                              _launchUrl(newsItem['link'] ?? '');
                            },
                            leading: Container(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  newsItem['image'] ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              newsItem['title'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines:
                                  2, // Define o número máximo de linhas do texto
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              newsItem['description'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontSize: 12,
                                  ),
                              maxLines:
                                  3, // Define o número máximo de linhas do texto
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ],
    );
  }
}
