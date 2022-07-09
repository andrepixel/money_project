import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/settings/about_page.dart';
import 'package:money_project/app/settings/menu_settings_page.dart';

class SettingsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const MenuSettingsPage(),
    ),
    ChildRoute(
      "/about",
      child: (context, args) => const AboutPage(),
    ),
  ];
}
