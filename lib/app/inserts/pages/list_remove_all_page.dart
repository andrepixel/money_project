import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/core/commons/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ListRemoveAllPage extends StatefulWidget {
  const ListRemoveAllPage({Key? key}) : super(key: key);

  @override
  State<ListRemoveAllPage> createState() => _ListRemoveAllPageState();
}

class _ListRemoveAllPageState
    // ignore: deprecated_member_use
    extends ModularState<ListRemoveAllPage, InsertController> {
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
            FieldMultipleChoicesWidget(
              initialValue: controller.initialValueButtonMenu2,
              listObjects: months,
              nameField: "Mês",
              variableController: controller.month,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            ButtonWithIconWidget(
              icon: Icons.remove_circle,
              label: "Remover",
              colorButton: Colors.red.shade100,
              colorIcon: Colors.red,
              colorLabel: Colors.red,
              myFunction: () => controller.removeInsertions(),
            ),
            Divider(),
            ValueListenableBuilder(
              valueListenable: controller.isVisible,
              builder: (context, bool isVisible, child) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder(
                    valueListenable: controller.isRemove,
                    builder: (context, bool isRemove, child) {
                      return ValueListenableBuilder(
                        valueListenable: controller.month,
                        builder: (context, String month, child) {
                          return Visibility(
                            visible: isVisible == true &&
                                    month == controller.copyMonth.value
                                ? true
                                : false,
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
                                children: [
                                  Icon(
                                    isRemove == true
                                        ? Icons.verified
                                        : Icons.remove_circle,
                                    size: 40,
                                    color: isRemove == true
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  Text(
                                    isRemove == true
                                        ? "As inserções do mês de\n${controller.month.value} do ano ${controller.year.value},\n foram removidas\ncom sucesso!"
                                        : "Não foi possível remover\nas inserções de\n${month} do ano ${controller.year.value},\nporque não existe\ninserções nesse mês!",
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
