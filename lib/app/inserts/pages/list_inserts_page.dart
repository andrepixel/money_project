import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';
import 'package:money_project/app/inserts/widgets/button_with_icon_widget.dart';
import 'package:money_project/app/inserts/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class ListInsertsPage extends StatefulWidget {
  const ListInsertsPage({Key? key}) : super(key: key);

  @override
  State<ListInsertsPage> createState() => _ListInsertsPageState();
}

class _ListInsertsPageState
    extends ModularState<ListInsertsPage, InsertController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Lista de Inserções",
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
              icon: Icons.list,
              label: "Listar",
              colorButton: Colors.grey.shade200,
              colorIcon: Colors.black87,
              colorLabel: Colors.black87,
              myFunction: () => controller.getData(
                isTrue: controller.isTrue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                width: 340,
                height: 1000,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:ListView.builder(
                        shrinkWrap: true,
                        itemCount: 200,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future:  controller.isTrue.value == true
                    ? controller
                                .listInserts(
                                  year: controller.year,
                                  month: controller.month,
                                )
                                .then((value) => value[index]): null,
                            builder: (context, snapshot) =>
                                snapshot.hasData == true
                                    ? Text("${snapshot.data.toString()}\n")
                                    : SizedBox.shrink(),
                          );
                        },
                      )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
