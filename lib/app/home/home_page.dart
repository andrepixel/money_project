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
                                fontSize: 18,
                              ),
                            ),
                            Icon(Icons.star)
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
                                "R\$ ${controller.sumValues.value}",
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
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.rocket_launch,
                          )
                        ],
                      ),
                      const SubMenuTextTipsWidget(
                        icon: Icons.add_box,
                        title: "Inserção",
                        text:
                            "É por aqui que você vai\nadicionar os seus gastos e ativos",
                      ),
                      const SubMenuTextTipsWidget(
                        icon: Icons.equalizer,
                        title: "Visualização",
                        text:
                            "Que tal saber se você vai\nindo bem nas economias?",
                      ),
                      const SubMenuTextTipsWidget(
                        icon: Icons.public,
                        title: "Notícias",
                        text:
                            "Que tal saber das notícias relacionados, a economia em\ngeral, e ficar atenados sobre tudo?",
                      ),
                      const SubMenuTextTipsWidget(
                        icon: Icons.newspaper,
                        title: "Artigos",
                        text:
                            "Aprender algo novo, é sempre\nbom. Vamos estudar um pouco sobre investimento, entre\noutras coisas legais?",
                      ),
                      const SubMenuTextTipsWidget(
                        icon: Icons.settings,
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
