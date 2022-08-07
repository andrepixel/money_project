import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/articles/articles_module.dart';
import 'package:money_project/app/home/home_module.dart';
import 'package:money_project/app/inserts/widgets/inserts_module.dart';
import 'package:money_project/app/notices/notices_module.dart';
import 'package:money_project/app/settings/settings_module.dart';
import 'package:money_project/core/commons/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  final SharedPreferences sharedPreferences;

  AppModule({
    required this.sharedPreferences,
  });

  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => Database(
            sharedPreferences: sharedPreferences,
          ),
        ),
      ];

  @override
  List<ModularRoute> routes = [
    // ModuleRoute(
    //   "/",
    //   module: HomeModule(),
    // ),
    //  ModuleRoute(
    //   "/notices/",
    //   module: NoticesModule(),
    // ),
    // ModuleRoute(
    //   "/settings/",
    //   module: SettingsModule(),
    // ),
    // ModuleRoute(
    //   "/articles/",
    //   module: ArticlesModule(),
    // ),
    //  ModuleRoute(
    //   "/inserts/",
    //   module: InsertsModule(),
    // )
    ModuleRoute(
      "/",
      module: InsertsModule(),
    )
  ];
}
