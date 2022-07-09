import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:money_project/app/settings/widgets/text_link_widget.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ComponentPopWidget(
            title: "Sobre",
            path: "/settings/",
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Container(
              height: 280,
              width: 287,
              decoration: BoxDecoration(
                color: Color(Colors.grey.shade200.value),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(40),
                  right: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLinkWidget(
                            text: "Money Project",
                            url: "https://github.com/flukebr/money_project",
                            subText:
                                ", é um trabalho de conclusão de curso (TCC), criado por",
                          ),
                          TextLinkWidget(
                            text: "André Barbosa Coura Valverde",
                            url:
                                "https://www.linkedin.com/in/andr%C3%A9-valverde-21398818a/",
                            subText: " e ",
                          ),
                          TextLinkWidget(
                            text: "Rodrigo Xavier Carvalho",
                            url:
                                "https://www.linkedin.com/in/rodrigo-xavier-5852b4156/",
                            subText: ", em 2022, desenvolvido com o framework ",
                          ),
                          TextLinkWidget(
                            text: "Flutter",
                            url: "https://flutter.dev/",
                            subText:
                                ". Esse projeto foi criado a partir de um estudo feito para entender o nível de conhecimento que a população tem sobre educação financeira. Propomos esse aplicativo para auxiliar a população a se concientizar para tal tema.",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        5.0,
                      ),
                      child: Divider(
                        indent: 50,
                        endIndent: 50,
                      ),
                    ),
                    Text(
                      "Money Project Version 1.0.0",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
