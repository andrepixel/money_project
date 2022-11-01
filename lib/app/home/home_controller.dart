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
