// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/core/commons/database/database.dart';

class OutputController extends ChangeNotifier {
  final Database database = Modular.get();

  Map valuesMonth = {};
  Map valueTyped = {};
  String monthKey = "";
  double sumValuesMonth = 0;
  double sumValuesYear = 0;

  ValueNotifier<String> backupYear = ValueNotifier("2022");
  ValueNotifier<String> values = ValueNotifier("");
  ValueNotifier<String> initialValueButtonMenu = ValueNotifier("2022");
  ValueNotifier<List> listMonthsValues = ValueNotifier([]);
  ValueNotifier<List> listValues = ValueNotifier([]);
  ValueNotifier<List<List<double>>> valuesMonths = ValueNotifier([]);
  ValueNotifier<String> year = YearValueNotifier("2022");

  void setData(
    dynamic value,
    bool isTypeInsertion,
    ValueNotifier<String> initialValue,
    ValueNotifier<String> variableController,
  ) {
    if (isTypeInsertion == true) {
      value == "Gasto"
          ? variableController.value = "-"
          : variableController.value = "+";
    }

    initialValue.value = value!;

    if (initialValue.value == value) {
      variableController.value = initialValue.value;
    } else {
      variableController.value = value;
    }

    year.value = variableController.value;
  }

  void getData() {
    if (year.value != "2022") {
      backupYear.value = year.value;
    }

    if (year.value == "2022" && backupYear.value == "2022") {
      values.value = database.getData(year: year.value);
    } else {
      values.value = database.getData(year: backupYear.value);
    }
  }

  double valuesLeftIntervalOutputPage() {
    sumValuesYear = 0;

    if (listValues.value.isEmpty) {
      return 0;
    }

    for (var element in listValues.value) {
      sumValuesYear += element;
    }

    sumValuesYear = double.parse(sumValuesYear.toString().replaceAll("-", ""));

    if (sumValuesYear <= 0) {
      return sumValuesYear + 1;
    } else {
      return sumValuesYear / 2;
    }
  }

  void getValuesMonths() {
    String valuesString = database.getData(year: year.value);

    valuesString = valuesString.replaceAll('{"', '"');
    valuesString = valuesString.replaceAll('}}', '}');
    
    valuesString = valuesString.replaceAll('}}', '}');

    print(valuesString);
  }

  List getMonthsOutput() {
    getData();

    listValues.value = [];

    final Map valuesMap = json.decode(values.value);

    valuesMap.forEach(
      (key, value) {
        Map valueRandom = {Random().nextInt(1000).toString(): "0"};
        List<String> valueParsedString = [];

        if (value.isEmpty) {
          valuesMonth.addAll(valueRandom);
        }

        if (key != monthKey) {
          monthKey = key;

          value.forEach((key, value) {
            valueParsedString.add(value);
          });

          for (var value in valueParsedString) {
            if (value.toString().contains("-")) {
              sumValuesMonth += double.parse(value);
            }
          }

          valuesMonth.addAll({valueRandom.keys.first: sumValuesMonth});

          sumValuesMonth = 0;
        }

        listMonthsValues.value.add(key);
      },
    );

    valuesMonth.forEach(
      (key, value) {
        listValues.value.add(value);
      },
    );

    return listValues.value;
  }

  List getMonthsInsert() {
    getData();

    listValues.value = [];

    final Map valuesMap = json.decode(values.value);

    valuesMap.forEach(
      (key, value) {
        Map valueRandom = {Random().nextInt(1000).toString(): "0"};
        List<String> valueParsedString = [];

        if (value.isEmpty) {
          valuesMonth.addAll(valueRandom);
        }

        if (key != monthKey) {
          monthKey = key;

          value.forEach(
            (key, value) {
              valueParsedString.add(value);
            },
          );

          for (var value in valueParsedString) {
            if (!value.toString().contains("-")) {
              sumValuesMonth += double.parse(value);
            }
          }

          valuesMonth.addAll({valueRandom.keys.first: sumValuesMonth});

          sumValuesMonth = 0;
        }

        listMonthsValues.value.add(key);
      },
    );

    valuesMonth.forEach(
      (key, value) {
        listValues.value.add(value);
      },
    );

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

class YearValueNotifier extends ValueNotifier<String> {
  YearValueNotifier(String value) : super(value);
}
