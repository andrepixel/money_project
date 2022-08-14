import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/app/inserts/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ListRemovePage extends StatefulWidget {
  const ListRemovePage({Key? key}) : super(key: key);

  @override
  State<ListRemovePage> createState() => _ListRemovePageState();
}

class _ListRemovePageState
    extends ModularState<ListRemovePage, InsertController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Remoção",
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
            ButtonWithIconWidget(
              icon: Icons.remove_circle,
              label: "Remover",
              colorButton: Colors.grey.shade200,
              colorIcon: Colors.red.shade500,
              colorLabel: Colors.red.shade500,
              myFunction: () => controller.database.removeData(
                year: controller.year.value,
                month: controller.month.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
