// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/app/outputs/widgets/button_icon_text_widget.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';
import 'package:money_project/core/commons/widgets/field_multiple_choices_widget.dart';

class OutputGraphic1MenuPage extends StatefulWidget {
  const OutputGraphic1MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OutputGraphic1MenuPage> createState() => _OutputGraphic1MenuPageState();
}

class _OutputGraphic1MenuPageState
    extends ModularState<OutputGraphic1MenuPage, OutputController> {
  @override
  void dispose() {
    controller.initialValueButtonMenu.dispose();
    controller.year.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Output",
              path: "/",
            ),
            FieldMultipleChoicesWidget(
              initialValue: controller.initialValueButtonMenu,
              listObjects: years,
              nameField: "Selecione o Ano",
              variableController: controller.year,
            ),
            ButtonIconTextWidget(
              isOutput: "false",
            ),
            ButtonIconTextWidget(
              isOutput: "true",
            ),
          ],
        ),
      ),
    );
  }
}
