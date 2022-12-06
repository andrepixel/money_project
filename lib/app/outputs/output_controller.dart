// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/constants.dart';

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
  List<List<String>> valuesMonthsString = [
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
    ["", ""],
  ];
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

    // Remove {} do inicio e fim
    valuesString = valuesString.substring(1, valuesString.length);
    valuesString = valuesString.substring(0, valuesString.length - 1);

    for (var i = 0; i < months.length; i++) {
      if (i < valuesMonthsString.length - 1) {
        if (valuesString.contains(RegExp('"\\${months[i]}": {},"'))) {
          valuesString =
              valuesString.replaceAll(RegExp('"\\${months[i]}": {},"'), '"');
          valuesMonthsString[i][0] = "2";
          valuesMonthsString[i][1] = "3";
          print('den $i -"${months[i]}": {},');
          print('den $i ${valuesMonthsString[i]}');
        } else {
          print('$i - ${valuesMonthsString[i]}');

          

          valuesMonthsString[i][0] = "0";
          valuesMonthsString[i][1] = "0";
          print('$i - ${months[i]}');
        }
      }
    }

    print(valuesString);
  }
// valuesString = valuesString.replaceAll('{"', '"');
  // valuesString = valuesString.replaceAll('}}', '}');

  // valuesString = valuesString.replaceAll('}}', '}');
  // valuesString = valuesString.replaceAll(RegExp('"[a-zA-Z]*": {}'), "");
  // valuesString = valuesString.replaceAll(RegExp('"[a-zA-Z]*":'), "");
  // valuesString = valuesString.replaceAll(RegExp(','), "");

  // if (valuesString.contains('"Março": {}')) {
  //   valuesString = valuesString.replaceAll(RegExp('"Março": {}'), "");
  // }

  // valuesString = valuesString.trim();
  // valuesString = valuesString.replaceAll(RegExp('}  '), "");
  // valuesString = valuesString.replaceAll(RegExp('"}'), '"');
  // valuesString = valuesString.replaceAll(RegExp('""'), ',');
  // valuesString = valuesString.replaceAll(RegExp('"'), '');
  // print(valuesString);
  // String valuesNegativeString = "";
  // String valuesPositiveString = "";

  // valuesNegativeString =
  //     valuesString.replaceAll(RegExp('(?:^|(?<![-0-9]))([0-9]+)'), ',');
  // valuesNegativeString = valuesNegativeString.replaceAll(RegExp(',,'), '');

  // valuesPositiveString = valuesString.replaceAll(RegExp('-(\\d)*,'), '');

  // print("neg -> ${valuesNegativeString}");
  // print("pos -> ${valuesPositiveString}");

  // List<String> valuesNegative = [];
  // List<String> valuesPositive = [];
  // int aux = 0;

  // for (var i = 0; i < valuesNegativeString.length; i++) {
  //   if (i < valuesNegativeString.length - 1) {
  //     if (valuesNegativeString[i] == '-') {
  //       i++;

  //       while (valuesNegativeString[i] != ",") {
  //         valuesNegative[aux] += valuesNegativeString[i];
  //       }

  //       aux++;

  //       continue;
  //     }
  //   }
  // }

  // print(valuesNegative);
  // valuesMonthsString.value[0][1] -= double.parse(valuesString[i]);

  // valuesMonthsString.value[0][0] = valuesString[i];
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
