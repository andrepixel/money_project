import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/articles/articles_module.dart';
import 'package:money_project/app/home/home_module.dart';
import 'package:money_project/app/notices/notices_module.dart';
import 'package:money_project/app/settings/settings_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> routes = [
    ModuleRoute(
      "/",
      module: HomeModule(),
    ),
     ModuleRoute(
      "/notices/",
      module: NoticesModule(),
    ),
    ModuleRoute(
      "/settings/",
      module: SettingsModule(),
    ),
    ModuleRoute(
      "/articles/",
      module: ArticlesModule(),
    )
  ];
}
