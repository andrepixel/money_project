
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const HomePage())
  ];
}