import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Container(
                height: 200,
                width: 287,
                decoration: BoxDecoration(
                  color: Color(Colors.grey.shade300.value),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "O que há de novo?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.mood)
                        ],
                      ),
                      const Text(
                        "Versão 1.0.0",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      const Text(
                        "* Inserção dos menus",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "* Notícias",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "* Artigos",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "* Inserção",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "* Visualização",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "* Configuração",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Container(
                height: 540,
                width: 287,
                decoration: BoxDecoration(
                  color: Color(Colors.grey.shade300.value),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Dicas",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.rocket_launch)
                        ],
                      ),
                      const SubMenuTextWidget(
                        icon: Icons.public,
                        title: "Menu - Notícias",
                        text:
                            "Que tal saber das notícias relacionados, a economia em geral, e ficar atenados sobre tudo?",
                      ),
                      const SubMenuTextWidget(
                        icon: Icons.newspaper,
                        title: "Menu - Artigos",
                        text: "Aprender algo novo, é sempre bom. Vamos estudar um pouco sobre investimento, entre outras coisas legais?",
                      ),
                      const SubMenuTextWidget(
                        icon: Icons.add_box,
                        title: "Menu - Inserção",
                        text: "É por aqui que você vai adicionar os seus gastos e ativos",
                      ),
                      const SubMenuTextWidget(
                        icon: Icons.equalizer,
                        title: "Menu - Visualização",
                        text: "Que tal saber se você vai indo bem nas economias?",
                      ),
                      const SubMenuTextWidget(
                        icon: Icons.settings,
                        title: "Menu - Configuração",
                        text: "Se precisar fazer ajustes adicionais, ou saber alguma informação extra, é por aqui.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 50,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          Icon(Icons.public),
          Icon(Icons.newspaper),
          Icon(Icons.add_box),
          Icon(Icons.equalizer),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}

class SubMenuTextWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const SubMenuTextWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 25,
              left: 5,
            ),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
