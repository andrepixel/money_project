// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/core/commons/database/database.dart';

class OutputController {
  final Database database = Modular.get();
  ValueNotifier<String> year = ValueNotifier("2022");
  ValueNotifier<String> values = ValueNotifier("");
  ValueNotifier<List> listMonthsValues = ValueNotifier([]);
  ValueNotifier<List> listValues = ValueNotifier([]);
  Map valuesMonth = {};
  Map valueTyped = {};
  String monthKey = "";
  double sumValuesMonth = 0;
  double sumValuesYear = 0;

  //String year
  void getData() {
    values.value = database.getData(year: year.value);
  }

  double valueMedian() {
    sumValuesYear = 0;

    for (var element in listValues.value) {
      sumValuesYear += element;
    }

    return sumValuesYear / 2;
  }

  Future<List> getMonths() async {
    getData();

    listValues.value = [];

    final Map valuesMap = json.decode(values.value);

    valuesMap.forEach((key, value) async {
      Map valueRandom = {Random().nextInt(1000).toString(): "0"};

      if (value.isEmpty) {
        valuesMonth.addAll(valueRandom);
      }

      if (key != monthKey) {
        monthKey = key;

        value.forEach((key, value) {
          sumValuesMonth += double.parse(value);
        });

        valuesMonth.addAll({valueRandom.keys.first: sumValuesMonth});

        sumValuesMonth = 0;
      }

      listMonthsValues.value.add(key);
    });

    valuesMonth.forEach((key, value) {
      listValues.value.add(value);
    });

    return listValues.value;
  }
}

class Values {
  final String month;
  final dynamic value;

  Values({
    required this.month,
    required this.value,
  });
}
