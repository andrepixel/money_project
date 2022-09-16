// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Artigos",
              path: "/",
            ),
            GestureDetector(
              onTap: () => Modular.to.pushNamed("article/0"),
              child: ArticleHandler(
                pathImage: "assets/images/article_image_1.png",
                title:
                    "O que é Educação Financeira?",
                boxFit: BoxFit.cover,
                colorBackground: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => Modular.to.pushNamed("article/1"),
              child: ArticleHandler(
                pathImage: "assets/images/article_image_2.png",
                title:
                    "2 Dicas para ajudar\nno seu investimento",
                boxFit: BoxFit.contain,
                colorBackground: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleHandler extends StatelessWidget {
  final String pathImage;
  final String title;
  final BoxFit boxFit;
  final Color colorBackground;

  const ArticleHandler({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.boxFit,
    required this.colorBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                color: colorBackground,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 170,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46),
                      ),
                      child: Image.asset(
                        pathImage,
                        fit: boxFit,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      12.0,
                    ),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
