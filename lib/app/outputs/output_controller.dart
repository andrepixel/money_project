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
  List<List<double>> valuesMonthsDouble = [
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
    [12, 12],
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
    String copyValuesString = valuesString;

    // Remove {} do inicio e fim
    valuesString = valuesString.substring(1, valuesString.length);
    valuesString = valuesString.substring(0, valuesString.length - 1);
    valuesString = valuesString.replaceAll('},"', '}@"');

    int auxChar = 0;
    int aux = 0;
    String auxString = "";
    String valuesNegative = "";
    String valuesPositive = "";
    List<String> listValuesPositiveString = ["", "", ""];
    List<String> listValuesNegativeString = ["", "", ""];
    List<double> listValuesPositiveDouble = [0, 0, 0];
    List<double> listValuesNegativeDouble = [0, 0, 0];

    for (var i = 0; i < months.length; i++) {
      if (valuesString.contains(RegExp('@"\\${months[i]}": {}'))) {
        valuesString = valuesString.replaceAll(
          RegExp('@"\\${months[i]}": {}'),
          '',
        );

        valuesMonthsDouble[i][0] = 0;
        valuesMonthsDouble[i][1] = 0;
      }

      if (valuesString.contains(RegExp('"\\${months[i]}": {}@'))) {
        valuesString = valuesString.replaceAll(
          RegExp('"\\${months[i]}": {}@'),
          '',
        );

        valuesMonthsDouble[i][0] = 0;
        valuesMonthsDouble[i][1] = 0;
      }

      auxChar = valuesString.indexOf(RegExp('@'));

      if (auxChar != -1) {
        auxString = valuesString.substring(0, auxChar);
      } else {
        print("");
      }

      auxString = auxString.replaceAll(RegExp('"|[a-zA-z]|: |{|}|ç'), '');
      valuesPositive = auxString.replaceAll(RegExp('-\\d'), '');
      valuesPositive = valuesPositive.replaceAll(',,', ',');

      if (valuesPositive == "2") {
        print(valuesPositive);
      }

      if (valuesPositive.isNotEmpty) {
        if (valuesPositive[0] == ',') {
          valuesPositive = valuesPositive.substring(1, valuesPositive.length);
        }

        if (valuesPositive.lastIndexOf(',') == valuesPositive.length) {
          valuesPositive = valuesPositive.substring(0, valuesPositive.length);
        }

        for (var i = 0; i < valuesPositive.length; i++) {
          if (valuesPositive[i] == ',') {
            aux++;
            continue;
          }

          listValuesPositiveString[aux] += valuesPositive[i];
        }

        for (var i = 0; i < listValuesPositiveString.length; i++) {
          if (listValuesPositiveString[i].isEmpty) {
            break;
          }

          listValuesPositiveDouble[i] =
              double.parse(listValuesPositiveString[i]);
        }

        double resultValue = 0;

        for (var i = 0; i < listValuesPositiveDouble.length; i++) {
          resultValue += listValuesPositiveDouble[i];
        }

        valuesMonthsDouble[i][0] = resultValue;

        aux = 0;
        valuesString = valuesString.substring(auxChar + 1, valuesString.length);

        auxChar = valuesString.indexOf(RegExp('@'));

        for (var i = 0; i < listValuesPositiveString.length; i++) {
          listValuesPositiveString[i] = "";
        }

        for (var i = 0; i < listValuesPositiveDouble.length; i++) {
          listValuesPositiveDouble[i] = 0;
        }

        for (var i = 0; i < valuesPositive.length; i++) {
          valuesPositive = "";
        }

        continue;
      }

      valuesMonthsDouble[i][0] = 0.0;

      aux = 0;

      if (auxChar != -1) {
        valuesString = valuesString.substring(auxChar + 1, valuesString.length);

        auxChar = valuesString.indexOf(RegExp('@'));

        continue;
      }

      valuesString = valuesString.substring(0, 0);

      for (var i = 0; i < listValuesPositiveString.length; i++) {
        listValuesPositiveString[i] = "";
      }

      for (var i = 0; i < valuesPositive.length; i++) {
        valuesPositive = "";
      }
    }

    print(valuesString);
  }

  // valuesNegativeString =
  //     valuesString.replaceAll(RegExp('(@:^|(@<![-0-9]))([0-9]+)'), ',');
  // valuesNegativeString = valuesNegativeString.replaceAll(RegExp(',,'), '');

  // valuesPositiveString = valuesString.replaceAll(RegExp('-(\\d)*,'), '');

  // print("neg -> ${valuesNegativeString}");
  // print("pos -> ${valuesPositiveString}");

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
