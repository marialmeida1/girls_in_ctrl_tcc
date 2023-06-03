import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsNewsHome extends StatefulWidget {
  const CardsNewsHome({super.key});

  @override
  State<CardsNewsHome> createState() => _CardsNewsHomeState();
}

class _CardsNewsHomeState extends State<CardsNewsHome> {
  List<dynamic> noticias = [];

  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void initState() {
    super.initState();
    fetchNoticias().then((data) {
      setState(() {
        noticias = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchNoticias(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final newsItem = noticias[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        // Ajuste o valor do raio desejado
                      ),
                      elevation: 2,
                      child: GestureDetector(
                        onTap: () {
                          _launchUrl(newsItem['link'] ?? '');
                        },
                        child: Container(
                          height: 220,
                          width: 140,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 100,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      newsItem['image'] ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Text(
                                        newsItem['title'] ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                        maxLines:
                                            2, // Define o número máximo de linhas do texto
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        newsItem['description'] ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                              fontSize: 14,
                                            ),
                                        maxLines:
                                            3, // Define o número máximo de linhas do texto
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
