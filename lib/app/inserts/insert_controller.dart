import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> years = [
  "2022",
  "2023",
  "2024",
  "2025",
  "2026",
  "2027",
  "2028",
  "2029",
  "2030",
];

const List<String> months = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro",
];

const List<String> typesInsert = [
  "Gasto",
  "Lucro",
];

class InsertController {
  final Database database = Modular.get();
  ValueNotifier<String> year = ValueNotifier("2022");
  ValueNotifier<String> month = ValueNotifier("Janeiro");
  ValueNotifier<String> type = ValueNotifier("-");
  ValueNotifier<String> itemName = ValueNotifier("0");
  ValueNotifier<String> itemValue = ValueNotifier("0");
  ValueNotifier<bool> stateInsertion = ValueNotifier(false);
  ValueNotifier<bool> isTrue = ValueNotifier(false);

  void insertData() {
    database.insertData(
      year: year.value,
      month: month.value,
      type: type.value,
      itemName: itemName.value,
      itemValue: itemValue.value,
    );

    stateInsertion.value = true;
  }

  void getData({
    required ValueNotifier<bool> isTrue,
  }) {
    print("--- 1 ${isTrue.value}");
    isTrue.value = !isTrue.value;
    print("--- 2 ${isTrue.value}");
  }

  Future<List> listInserts({
    required ValueNotifier<String> year,
    required ValueNotifier<String> month,
  }) async {
    final list = database.getData(
      year: year.value,
    );

    final Map jsonParsed = json.decode(list);
    final List jsonList = [];

    jsonParsed.forEach((key, value) {
      key == month.value ? jsonList.add(value) : null;
    });

    return jsonList;
  }
}
