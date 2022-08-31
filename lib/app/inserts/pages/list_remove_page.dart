import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/core/commons/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

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
              nameField: "Selecione o Ano",
              variableController: controller.year,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            FieldMultipleChoicesWidget(
              initialValue: controller.initialValueButtonMenu2,
              listObjects: months,
              nameField: "Selecione o Mês",
              variableController: controller.month,
            ),
            Divider(
              color: Colors.transparent,
              height: 7,
            ),
            ButtonWithIconWidget(
              icon: Icons.remove_circle,
              label: "Remover",
              colorButton: Colors.grey.shade200,
              colorIcon: Colors.red.shade500,
              colorLabel: Colors.red.shade500,
              myFunction: () => controller.removeData(),
            ),
            Divider(),
            ValueListenableBuilder(
              valueListenable: controller.isRemove,
              builder: (context, value, child) {
                return Visibility(
                  visible: controller.isRemove.value == true ? true : false,
                  child: Container(
                    width: 310,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified,
                          size: 30,
                          color: Colors.green.shade900,
                        ),
                        Text(
                          "As inserções do mês de ${controller.month.value}\ndo ano ${controller.year.value}, foram removidas\ncom sucesso!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            wordSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
