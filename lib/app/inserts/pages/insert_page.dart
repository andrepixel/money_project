import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/app/inserts/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/app/inserts/widgets/field_text_widget.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends ModularState<InsertPage, InsertController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Inserção",
              path: "/",
            ),
            FieldMultipleChoicesWidget(
              initialValue: "2022",
              listObjects: years,
              nameField: "Selecione o Ano",
              variableController: controller.year,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            FieldMultipleChoicesWidget(
              initialValue: "Janeiro",
              listObjects: months,
              nameField: "Selecione o Mês",
              variableController: controller.month,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            FieldMultipleChoicesWidget(
              initialValue: "Gasto",
              listObjects: typesInsert,
              nameField: "Selecione o tipo da inserção",
              isTypeInsertion: true,
              variableController: controller.type,
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
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            ValueListenableBuilder(
              valueListenable: controller.stateInsertion,
              builder: (context, value, child) {
                return FieldTextWidget(
                  nameField: "Valor da inserção",
                  typeMoney: true,
                  variableController: controller.itemValue,
                  isTypeValue: true,
                  isStateInsertionIsTrue: controller.stateInsertion,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: IntrinsicHeight(
                child: SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonWithIconWidget(
                            icon: Icons.list,
                            label: "Listar",
                            colorButton: Colors.grey.shade200,
                            colorIcon: Colors.black87,
                            colorLabel: Colors.black87,
                            myFunction: () =>
                                Modular.to.pushNamed("/listInserts/"),
                          ),
                          ButtonWithIconWidget(
                              icon: Icons.verified,
                              label: "Inserir",
                              colorButton: Colors.grey.shade200,
                              colorIcon: Colors.yellow.shade900,
                              colorLabel: Colors.yellow.shade900,
                              myFunction: () => controller.insertData()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonWithIconWidget(
                            icon: Icons.remove_circle,
                            label: "Remover",
                            colorButton: Colors.grey.shade200,
                            colorIcon: Colors.red.shade500,
                            colorLabel: Colors.red.shade500,
                            myFunction: () =>
                                Modular.to.pushNamed("/listRemoveInserts/"),
                          ),
                          ButtonWithIconWidget(
                            icon: Icons.save,
                            label: "Salvar",
                            colorButton: Colors.grey.shade200,
                            colorIcon: Colors.green.shade500,
                            colorLabel: Colors.green.shade500,
                            myFunction: () => controller.database.insertData(
                              year: controller.year.value,
                              month: controller.month.value,
                              type: controller.type.value,
                              itemName: controller.itemName.value,
                              itemValue: controller.itemValue.value,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
