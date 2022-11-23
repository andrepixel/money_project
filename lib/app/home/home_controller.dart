import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/constants.dart';

import '../../core/commons/database/database.dart';

class HomeController {
  List<String> newValues = List<String>.filled(100, "");
  List<String> cnewValues = List<String>.filled(100, "");
  ValueNotifier<double> sumValues = ValueNotifier(0);
  final Database database = Modular.get();
  final List jsonList = [];
  final regexSpace = RegExp(r" ", caseSensitive: false, multiLine: false);
  final regexCaractere =
      RegExp(r"[a-zA-Z]", caseSensitive: false, multiLine: false);
  final regexComma = RegExp(r",", caseSensitive: false, multiLine: false);
  final regexColon = RegExp(r":", caseSensitive: false, multiLine: false);
  final regex5 = RegExp(r"-", caseSensitive: false, multiLine: false);
  var aux = 0;

  void sumInsertions() {
    listInserts();

    if (jsonList.isNotEmpty) {
      for (var element in jsonList) {
        String values = element.toString();

        values = values.replaceAll("{", "");
        values = values.replaceAll("}", ",");

        values = values.replaceAll(regexCaractere, "");
        values = values.replaceAll(regexColon, "");
        values = values.replaceAll(regexSpace, "");

        for (var i = 0; i < values.length; i++) {
          if (!values[i].contains(",") && !values[i].contains("-")) {
            newValues[aux] += values[i];
          }

          if (values[i].contains(",")) {
            aux++;
          }

          if (values[i].contains("-")) {
            newValues[aux] = values[i];
          }
        }
      }

      for (var i = 0; i < newValues.length; i++) {
        if (newValues[i].isNotEmpty) {
          sumValues.value += double.parse(newValues[i]);
        }
      }
    }

    aux++;
  }

  String returnValueFormated() {
    String sumValueString = sumValues.value.toString();
    List<String> values = List.filled(50, "");
    String trimValues = "";
    var aux = 0;

    sumValueString = sumValueString.replaceAll(".", ",");
    sumValueString = sumValueString + "0";

    for (var i = 0; i < sumValueString.length; i++) {
      if (sumValueString[i] == ',') {
        for (var i = 0; i < values.length; i++) {
          if (values[i].isNotEmpty) {
            trimValues += values[i].toString();
          }
        }

        if (trimValues[0] == "-") {
          sumValueString = adjustValueNegative(
            trimValues,
            values,
            sumValueString,
            aux,
          );

          break;
        }

        sumValueString = adjustValuePositive(
          trimValues,
          values,
          sumValueString,
          aux,
        );

        break;
      }

      if (i < values.length - 1) {
        values[i] = sumValueString[i];
      }
    }

    return sumValueString + ",00";
  }

  String adjustValuePositive(
    String trimValues,
    List<String> values,
    String sumValueString,
    int aux,
  ) {
    if (trimValues.length == 4) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[1] = ".";

      for (var i = 2; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 5) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[2] = ".";

      for (var i = 3; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 6) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[3] = ".";

      for (var i = 4; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 7) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }
      
      values[1] = ".";

      for (var i = 2; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }
     
      values[5] = ".";

      for (var i = 4; i < newValues.length + 1; i++) {
        if (i < newValues.length) {
          values[i + 2] = newValues[i];
        }
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    return "";
  }

  String adjustValueNegative(
    String trimValues,
    List<String> values,
    String sumValueString,
    int aux,
  ) {
    if (trimValues.length <= 4) {
      sumValueString = trimValues.replaceAll(",00", "").toString();

      return sumValueString;
    }

    if (trimValues.length == 5) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[2] = ".";

      for (var i = 3; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 6) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[3] = ".";

      for (var i = 4; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 7) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[4] = ".";

      for (var i = 5; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    if (trimValues.length == 8) {
      List<String> newValues = List.filled(trimValues.length, "");

      for (var i = 0; i < trimValues.length; i++) {
        if (i < trimValues.length) {
          newValues[aux] = trimValues[i];
          aux++;
        }
      }

      values[2] = ".";

      for (var i = 3; i < newValues.length + 1; i++) {
        values[i] = newValues[i - 1];
      }
     
      values[6] = ".";

      for (var i = 5; i < newValues.length + 1; i++) {
        if (i < newValues.length) {
          values[i + 2] = newValues[i];
        }
      }

      sumValueString = "";

      for (var i = 0; i < values.length; i++) {
        if (values[i].isEmpty) {
          break;
        }

        sumValueString += values[i];
      }

      return sumValueString;
    }

    return "";
  }

  void listInserts() {
    for (var i = 0; i < years.length; i++) {
      final list = database.getData(
        year: years[i],
      );

      if (list.isNotEmpty) {
        final Map jsonParsed = json.decode(list);

        for (var i = 0; i < months.length; i++) {
          jsonParsed.forEach(
            (key, value) {
              if (value.toString().length == 2) {
                value = value.toString().replaceAll("{", "");
                value = value.toString().replaceAll("}", "");
              }

              key == months[i] ? jsonList.add(value) : null;
            },
          );
        }
      }
    }
  }
}
