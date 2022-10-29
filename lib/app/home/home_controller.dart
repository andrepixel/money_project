import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/constants.dart';

import '../../core/commons/database/database.dart';

class HomeController {
  final Database database = Modular.get();
  final List jsonList = [];
  ValueNotifier<double> sumValues = ValueNotifier(0);

  double sumInsertions() {
    listInserts();

    if (jsonList.isNotEmpty) {
      for (var element in jsonList) {
        print(element);

        String values = element.toString();

        values = values.replaceAll("{", "");
        values = values.replaceAll("}", "");

        // print(values);

        var regex1 = RegExp(r"\d", caseSensitive: false, multiLine: false);
        var regex2 =
            RegExp(r"[a-zA-Z]", caseSensitive: false, multiLine: false);
        var regex3 = RegExp(r",", caseSensitive: false, multiLine: false);

        var newValues = List<String>.filled(100, "");
        var copyValues = List<String>.filled(values.length, values);
        String aux = "";
        int auxInt = 0;

        for (var i = 0; i < values.length; i++) {
          if (values[i] == '-') {
            aux += values[i];
            aux += values[i + 1];

            // print(aux);

            newValues[auxInt] = aux;

            auxInt++;
            i += 2;

            aux = "";
          }

          if (i < values.length) {
            // print(values[i]);
            // print(values[i + 1]);

            var isNumber = regex1.hasMatch(values[i]);
            var isCaractere = regex2.hasMatch(copyValues[i + 1]);
            var isComma = regex3.hasMatch(copyValues[i + 1]);

            if ((isNumber && isCaractere) || (isNumber && isComma)) {
              newValues[auxInt] = values[i];

              auxInt++;
            }
          }
        }

        double valuesDouble = 0.0;

        for (var i = 0; i < newValues.length; i++) {
          if (newValues[i] == "") {
            break;
          }

          // print(newValues[i]);

          valuesDouble += double.parse(newValues[i]);
        }

        // print(valuesDouble);

        sumValues.value += valuesDouble;
      }
    }
    return sumValues.value;
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
