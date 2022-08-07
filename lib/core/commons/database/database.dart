import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const PATH = "/money.db";

class Database extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  Database({
    required this.sharedPreferences,
  });

  void openDatabase() async {
    sharedPreferences.setString("2022",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2023",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2024",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2025",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2026",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2027",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2028",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2029",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
    sharedPreferences.setString("2030",
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
  }

  void insertData({
    required String year,
    required String month,
    required String type,
    required String itemName,
    required String itemValue,
  }) {
    var values = sharedPreferences.getString(year) ?? "";
    print("antigo -- $values");

    if (itemValue.contains(",")) {
      itemValue = itemValue.replaceAll(",", ".");
    }

    if (type == "-") {
      String itemWithDash = type + itemValue;

      values = values.replaceAll(
          '"$month": {', '"$month": {"$itemName": "$itemWithDash",');
    } else {
      values = values.replaceAll(
          '"$month": {', '"$month": {"$itemName": "$itemValue",');
    }

    values = values.replaceAll(',},', '},');

    sharedPreferences.remove(year);
    sharedPreferences.setString(year, values);

    String newValue = sharedPreferences.getString(year) ?? "";

    print(newValue);
  }

  void getData({required String year}) {
    String text = sharedPreferences.getString(year) ?? "";

    print(text);
  }

  void removeData({required String year}) {
    sharedPreferences.remove(year);

    sharedPreferences.setString(year,
        '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {},}');
  }

  // static Future<void> openDatabase() async {
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String newPathDirectory = directory.path + PATH;
//
  //   if (newPathDirectory.isNotEmpty) {
  //     await Directory(newPathDirectory).create(recursive: true);
  //   }
//
  //   Hive.init(newPathDirectory);
  //   await Hive.openBox('user');
  //   final box = Hive.box('user');
//
  //   box.values.isEmpty
  //       ? box.putAll({
  //           "2022": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2023": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2024": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2025": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2026": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2027": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2028": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2029": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //           "2030": {
  //             "Janeiro": {},
  //             "Fevereiro": {},
  //             "Março": {},
  //             "Abril": {},
  //             "Maio": {},
  //             "Junho": {},
  //             "Julho": {},
  //             "Agosto": {},
  //             "Setembro": {},
  //             "Outubro": {},
  //             "Novembro": {},
  //             "Dezembro": {},
  //           },
  //         })
  //       : null;

  //   print(box.values);
  // }
}
