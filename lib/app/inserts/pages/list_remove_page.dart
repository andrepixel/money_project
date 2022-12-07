import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/core/commons/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

import '../widgets/field_text_widget.dart';

class ListRemovePage extends StatefulWidget {
  const ListRemovePage({Key? key}) : super(key: key);

  @override
  State<ListRemovePage> createState() => _ListRemovePageState();
}

class _ListRemovePageState
    // ignore: deprecated_member_use
    extends ModularState<ListRemovePage, InsertController> {
  @override
  void initState() {
    controller.isRemove.value = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Remoção",
              path: "/inserts/",
            ),
            FieldMultipleChoicesWidget(
              initialValue: controller.initialValueButtonMenu,
              listObjects: years,
              nameField: "Ano",
              variableController: controller.year,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            ValueListenableBuilder(
              valueListenable: controller.stateInsertion,
              builder: (context, value, child) {
                return FieldTextWidget(
                  nameField: "Nome da inserção",
                  typeMoney: false,
                  variableController: controller.itemName,
                  isStateInsertionIsTrue: controller.stateInsertion,
                );
              },
            ),
            ButtonWithIconWidget(
              icon: Icons.remove_circle,
              label: "Remover",
              colorButton: Colors.red.shade100,
              colorIcon: Colors.red.shade500,
              colorLabel: Colors.red.shade500,
              myFunction: () {
                controller.removeInsertion(itemName: controller.itemName);
                controller.isVisible.value = true;
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ValueListenableBuilder(
                valueListenable: controller.isRemove,
                builder: (context, bool isRemove, child) {
                  return ValueListenableBuilder(
                    valueListenable: controller.itemName,
                    builder: (context, String itemName, child) {
                      return ValueListenableBuilder(
                        valueListenable: controller.copyItemName,
                        builder: (context, String copyItemName, child) {
                          return ValueListenableBuilder(
                            valueListenable: controller.isVisible,
                            builder: (context, bool isVisible, child) {
                              return Visibility(
                                visible: isVisible == true,
                                child: Container(
                                  width: 270,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isRemove == true
                                        ? Colors.green.shade100
                                        : Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.verified,
                                          size: 40,
                                          color: isRemove == true
                                              ? Colors.green.shade500
                                              : Colors.red.shade500,
                                        ),
                                      ),
                                      Text(
                                        isRemove == true
                                            ? "A inserção\n${controller.itemName.value}\nque se encontra em \n${controller.year.value}, foi removida\ncom sucesso!"
                                            : "Não existe a inserção\n${controller.itemName.value} em ${controller.year.value},\n não foi possível\nremover!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          wordSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
