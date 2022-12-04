import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/app/outputs/pages/global_menu_output_page.dart';
import 'package:money_project/app/outputs/pages/output_graphic1_menu_page.dart';
import 'package:money_project/app/outputs/pages/output_graphic1_page.dart';
import 'package:money_project/app/outputs/pages/output_graphic2_menu_page.dart';
import 'package:money_project/app/outputs/pages/output_graphic2_page.dart';

class OutputModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => OutputController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => GlobalMenuOutputPage(),
    ),
    ChildRoute(
      '/outputGraphic1Page/:isOutput',
      child: (context, args) => OutputGraphic1Page(
        isOutput: args.data,
      ),
    ),
    ChildRoute(
      '/outputGraphic2Page',
      child: (context, args) => OutputGraphic2Page(),
    ),
    ChildRoute(
      '/outputmenu1',
      child: (context, args) => OutputGraphic1MenuPage(),
    ),
    ChildRoute(
      '/outputmenu2',
      child: (context, args) => OutputGraphic2MenuPage(),
    ),
  ];
}
