import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/outputs/output_controller.dart';

import '../../../core/commons/constants.dart';
import '../../../core/commons/widgets/component_pop_widget.dart';
import '../../../core/commons/widgets/field_multiple_choices_widget.dart';

class OutputGraphic2MenuPage extends StatefulWidget {
  const OutputGraphic2MenuPage({Key? key}) : super(key: key);

  @override
  State<OutputGraphic2MenuPage> createState() => _OutputGraphic2MenuPageState();
}

class _OutputGraphic2MenuPageState
    extends ModularState<OutputGraphic2MenuPage, OutputController> {
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
            Padding(
              padding: const EdgeInsets.only(
                top: 130,
              ),
              child: SizedBox(
                height: 150,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue,
                            ),
                          ),
                          onPressed: () =>
                              Modular.to.pushNamed("outputGraphic2Page"),
                          icon: Icon(
                            Icons.bar_chart_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          label: Text(
                            "Visualizar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Visualize seus dados\nem um gráfico lindão!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
