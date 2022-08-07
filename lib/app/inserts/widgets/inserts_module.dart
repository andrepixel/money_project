import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/widgets/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/insert_page.dart';
import 'package:money_project/core/commons/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertsModule extends Module {
  // final SharedPreferences sharedPreferences;

  // InsertsModule({
  //   required this.sharedPreferences,
  // });

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
  ];
}
