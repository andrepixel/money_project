import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/pages/insert_page.dart';
import 'package:money_project/app/inserts/pages/list_inserts_page.dart';
import 'package:money_project/app/inserts/pages/list_remove_page.dart';

class InsertsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => InsertController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => InsertPage(),
    ),
    ChildRoute(
      '/listInserts',
      child: (context, args) => ListInsertsPage(),
    ),
    ChildRoute(
      '/listRemoveInserts',
      child: (context, args) => ListRemovePage(),
    ),
  ];
}
