import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/core/commons/database/database.dart';

class InsertController {
  final Database database = Modular.get();
  ValueNotifier<String> year = ValueNotifier("2022");
  ValueNotifier<String> initialValueButtonMenu = ValueNotifier("2022");
  ValueNotifier<String> initialValueButtonMenu2 = ValueNotifier("Janeiro");
  ValueNotifier<String> initialValueButtonMenu3 = ValueNotifier("Despesa");
  ValueNotifier<String> month = ValueNotifier("Janeiro");
  ValueNotifier<String> copyMonth = ValueNotifier("Janeiro");
  ValueNotifier<String> type = ValueNotifier("-");
  ValueNotifier<String> itemName = ValueNotifier("0");
  ValueNotifier<String> copyItemName = ValueNotifier("");
  ValueNotifier<String> itemValue = ValueNotifier("0");
  ValueNotifier<bool> stateInsertion = ValueNotifier(false);
  ValueNotifier<bool> isTrue = ValueNotifier(false);
  ValueNotifier<bool> isRemove = ValueNotifier(false);
  ValueNotifier<bool> isVisible = ValueNotifier(false);

  void insertData() async {
    await database.insertData(
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
    isTrue.value = !isTrue.value;
  }

  void removeInsertion({required ValueNotifier<String> itemName}) {
    if (copyItemName.value == itemName.value) {

    } else {
      isRemove.value = false;

      if (isRemove.value == false) {
        copyItemName.value = itemName.value;

        database
            .removeInsertion(
              year: year.value,
              itemName: itemName.value,
            )
            .then(
              (value) => isRemove.value = value,
            );

        isVisible.value = false;
        isVisible.value = true;
        isRemove.value = false;
        isRemove.value = false;
      } else {
        isRemove.value = false;
        isVisible.value = true;
      }
    }
  }

void removeInsertions() {
    if (isRemove.value == false) {
      copyMonth.value = month.value;

      database
          .removeInsertions(
            year: year.value,
            month: month.value,
          )
          .then(
            (value) => isRemove.value = value,
          );

      isVisible.value = false;
      isVisible.value = true;
    } else {
      isRemove.value = false;
      isVisible.value = true;
    }
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

    for (var element in jsonList) {
      String newElement = element.toString();

      newElement = newElement.replaceAll("{", "");
      newElement = newElement.replaceAll("}", "");
      newElement = newElement.replaceAll(",", "\n");

      jsonList.remove(element);
      jsonList.add(newElement);
    }

    return jsonList;
  }
}
