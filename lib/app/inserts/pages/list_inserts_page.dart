import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/pages/result_inserts_widget.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/core/commons/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ListInsertsPage extends StatefulWidget {
  const ListInsertsPage({Key? key}) : super(key: key);

  @override
  State<ListInsertsPage> createState() => _ListInsertsPageState();
}

class _ListInsertsPageState
    // ignore: deprecated_member_use
    extends ModularState<ListInsertsPage, InsertController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Lista de Inserções",
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
              icon: Icons.list,
              label: "Listar",
              colorButton: Colors.grey.shade200,
              colorIcon: Colors.black87,
              colorLabel: Colors.black87,
              myFunction: () {
                controller.indexKey.value = 0;
                controller.indexValue.value = 0;
                controller.getData(isTrue: controller.isTrue);
              },
            ),
            Visibility(
              visible: controller.isTrue != true ? true : false,
              child: ValueListenableBuilder(
                valueListenable: controller.isTrue,
                builder: (context, value, child) => ResultInsertsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
