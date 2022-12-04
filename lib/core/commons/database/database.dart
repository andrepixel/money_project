import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const PATH = "/money.db";

class Database extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  Database({
    required this.sharedPreferences,
  });

  void openDatabase() async {
    if (sharedPreferences.containsKey("2022")) {
    } else {
      sharedPreferences.setString("2022",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2023",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2024",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2025",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2026",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2027",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2028",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2029",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
      sharedPreferences.setString("2030",
          '{"Janeiro": {},"Fevereiro": {},"Março": {},"Abril": {},"Maio": {},"Junho": {},"Julho": {},"Agosto": {},"Setembro": {},"Outubro": {},"Novembro": {},"Dezembro": {}}');
    }
  }

  Future<void> insertData({
    required String year,
    required String month,
    required String type,
    required String itemName,
    required String itemValue,
  }) async {
    if (itemName.isEmpty || itemValue.isEmpty) {}

    var values = sharedPreferences.getString(year) ?? "";

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
    values = values.replaceAll(',}}', '}}');

    await sharedPreferences.remove(year);
    await sharedPreferences.setString(year, values);
  }

  String getData({required String year}) {
    String text = sharedPreferences.getString(year) ?? "";

    return text;
  }

  bool removeInsertion({
    required String year,
    required String month,
    required String itemName,
  }) {
    String values = sharedPreferences.getString(year) ?? "";

    if (values.contains('"${itemName}":')) {
      values = values.replaceAll(
        RegExp('"$itemName": "(\\d)*",'),
        '',
      );

      sharedPreferences.remove(year);
      sharedPreferences.setString(year, values);

      return true;
    }
    return false;
  }

  bool removeInsertions({
    required String year,
    required String month,
  }) {
    String values = sharedPreferences.getString(year) ?? "";

    if (values.contains('"$month\": ({[^{}]+})')) {
      values = values.replaceAll(
        RegExp('"$month\": ({[^{}]+})'),
        '"$month\": {}',
      );

      sharedPreferences.remove(year);
      sharedPreferences.setString(year, values);

      return true;
    }
    return false;
  }
}
