import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/home/home_controller.dart';
import 'package:money_project/app/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:money_project/app/home/widgets/sub_menu_text_tips_widget.dart';
import 'package:money_project/app/home/widgets/text_title_update_widget.dart';
import 'package:money_project/app/home/widgets/text_topic_update_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.sumInsertions();
  }

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
              child: SafeArea(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: BoxDecoration(
                    color: Color(Colors.grey.shade300.value),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(40),
                      right: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Seu Saldo  ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            right: 30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "R\$ ${controller.returnValueFormated() == ",00" ? "0,00" : controller.returnValueFormated()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Container(
                height: 240,
                width: MediaQuery.of(context).size.width * 2,
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
                      TextTitleUpdateWidget(
                        title: "O que há de novo?   ",
                        subTitle: "Versão 1.0.0     ",
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextTopicUpdateWidget(
                            topic: [
                              ["Inserção de menus"],
                            ],
                            subTopic: [
                              [
                                "Inserção",
                                "Visualização",
                                "Notícias",
                                "Artigos",
                                "Configuração",
                              ],
                            ],
                          ),
                        ],
                      ),
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
                width: MediaQuery.of(context).size.width * 2,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Dicas  ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.rocket_launch,
                            color: Colors.blue,
                            shadows: [
                              Shadow(
                                blurRadius: 0.5,
                                color: Colors.black87,
                              )
                            ],
                          )
                        ],
                      ),
                      SubMenuTextTipsWidget(
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.green,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 0.1,
                            )
                          ],
                        ),
                        title: "Inserção",
                        text:
                            "É por aqui que você vai\nadicionar os seus gastos e ativos",
                      ),
                      SubMenuTextTipsWidget(
                        icon: Icon(
                          Icons.equalizer,
                          color: Colors.purple,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 0.1,
                            )
                          ],
                        ),
                        title: "Visualização",
                        text:
                            "Que tal saber se você vai\nindo bem nas economias?",
                      ),
                      SubMenuTextTipsWidget(
                        icon: Icon(
                          Icons.public,
                          color: Colors.blue.shade900,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 0.1,
                            )
                          ],
                        ),
                        title: "Notícias",
                        text:
                            "Que tal saber das notícias relacionados, a economia em\ngeral, e ficar atenados sobre tudo?",
                      ),
                      SubMenuTextTipsWidget(
                        icon: Icon(
                          Icons.newspaper,
                          color: Colors.brown,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 0.1,
                            )
                          ],
                        ),
                        title: "Artigos",
                        text:
                            "Aprender algo novo, é sempre\nbom. Vamos estudar um pouco sobre investimento, entre\noutras coisas legais?",
                      ),
                      SubMenuTextTipsWidget(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.grey,
                          shadows: [
                            Shadow(
                              color: Colors.black87,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        title: "Configuração",
                        text:
                            "Se precisar fazer ajustes\nadicionais, ou saber alguma informação extra, é por aqui.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
