import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app_module.dart';
import 'package:money_project/app_widget.dart';
import 'package:money_project/core/commons/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final Database database = Database(sharedPreferences: sharedPreferences);

  database.openDatabase();

  return runApp(
    ModularApp(
      module: AppModule(
        sharedPreferences: sharedPreferences,
      ),
      
      child: const AppWidget(),
    ),
  );
}
