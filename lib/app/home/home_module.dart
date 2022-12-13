import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/articles/articles_module.dart';
import 'package:money_project/app/home/home_controller.dart';
import 'package:money_project/app/home/home_page.dart';
import 'package:money_project/app/notices/notices_module.dart';
import 'package:money_project/app/settings/settings_module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
     Bind.lazySingleton(
      (i) => HomeController(),
    ),
  ];


  @override
  List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const HomePage(),
    ),
    ModuleRoute(
      "/settings/",
      module: SettingsModule(),
    ),
     ModuleRoute(
      "/articles/",
      module: ArticlesModule(),
    ),
     ModuleRoute(
      "/notices/",
      module: NoticesModule(),
    )
  ];
}
