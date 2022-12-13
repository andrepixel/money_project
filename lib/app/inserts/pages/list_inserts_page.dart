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
              icon: Icons.list,
              label: "Listar",
              colorButton: Colors.black12,
              colorIcon: Colors.black87,
              colorLabel: Colors.black87,
              myFunction: () {
                controller.indexKey.value = 0;
                controller.indexValue.value = 0;
                controller.getData(isTrue: controller.isTrue);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                width: 330,
                height: 1000,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 200,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ValueListenableBuilder(
                      valueListenable: controller.isTrue,
                      builder: (context, bool isTrue, child) {
                        return FutureBuilder(
                          future: controller
                              .listInserts(
                                year: controller.year,
                                month: controller.month,
                              )
                              .then((value) => value[index]),
                          builder: (context, snapshot) =>
                              snapshot.hasData == true
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${controller.month.value} - ${controller.year.value}",
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            child: Container(
                                              color: Colors.grey,
                                              height: 1,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Text(
                                              "${snapshot.data.toString()}\n",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
