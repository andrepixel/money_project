import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/app/outputs/pages/output_menu_page.dart';
import 'package:money_project/app/outputs/pages/output_page.dart';

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
      child: (context, args) => OutputMenuPage(),
    ),
    ChildRoute(
      '/outputPage/:isOutput',
      child: (context, args) => OutputPage(
        isOutput: args.data,
      ),
    ),
  ];
}
