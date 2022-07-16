import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/app/articles/article_controller.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ArticlePage extends StatefulWidget {
  final String id;

  const ArticlePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final ArticleController controller = Modular.get<ArticleController>();

  @override
  Widget build(BuildContext context) {
    final idParsed = int.parse(widget.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "",
              path: "/articles/",
            ),
            Container(
              width: 270,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listArticle[idParsed].length,
                      itemBuilder: (context, index) {
                        return controller.listArticle[idParsed][index].first
                                .contains("[image]")
                            ? SizedBox(
                                height: 170,
                                width: 250,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    controller
                                        .listArticle[idParsed][index].first
                                        .substring(7),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : controller.listArticle[idParsed][index].first
                                    .contains("[subImage]")
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: SizedBox(
                                      height: 170,
                                      width: 250,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          controller
                                              .listArticle[idParsed][index]
                                              .first
                                              .substring(10),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  )
                                : controller.listArticle[idParsed][index].first
                                        .contains("[title]")
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 5,
                                        ),
                                        child: Text(
                                          controller
                                              .listArticle[idParsed][index]
                                              .first
                                              .substring(7),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      )
                                    : controller
                                            .listArticle[idParsed][index].first
                                            .contains("[subTitle]")
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 5,
                                            ),
                                            child: Text(
                                              controller
                                                  .listArticle[idParsed][index]
                                                  .first
                                                  .substring(10),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          )
                                        : controller
                                                .listArticle[idParsed][index]
                                                .first
                                                .contains("[text]")
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 10,
                                                ),
                                                child: Text(
                                                  controller
                                                      .listArticle[idParsed]
                                                          [index]
                                                      .first
                                                      .substring(6),
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
