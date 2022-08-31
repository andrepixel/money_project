import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/articles/article_controller.dart';
import 'package:money_project/app/articles/article_page.dart';
import 'package:money_project/app/articles/articles_page.dart';

class ArticlesModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => ArticleController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, args) => ArticlesPage(),
    ),
    ChildRoute(
      "/article/:id",
      child: (_, args) => ArticlePage(id: args.params['id']),
    ),
  ];
}
