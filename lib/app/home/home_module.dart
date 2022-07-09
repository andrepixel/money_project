import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/home/home_page.dart';
import 'package:money_project/app/settings/settings_module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const HomePage(),
    ),
    ModuleRoute(
      "/settings/",
      module: SettingsModule(),
    )
  ];
}
