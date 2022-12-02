import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/insert_controller.dart';

class ResultInsertsWidget extends StatefulWidget {
  const ResultInsertsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultInsertsWidget> createState() => _ResultInsertsWidgetState();
}

class _ResultInsertsWidgetState
    extends ModularState<ResultInsertsWidget, InsertController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: controller.month,
              builder: (context, value, child) => Text(
                "${controller.month.value}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(" - "),
            ValueListenableBuilder(
              valueListenable: controller.year,
              builder: (context, value, child) => Text(
                "${controller.year.value}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
            top: 10,
          ),
          child: Container(
            width: 330,
            height: 1000,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.lengthValues(
                year: controller.year,
                month: controller.month,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: controller.newList,
                  builder: (context, value, child) {
                    return FutureBuilder(
                      future: controller
                          .listMap(
                            year: controller.year,
                            month: controller.month,
                          )
                          .then((value) => value),
                      builder: (
                        context,
                        AsyncSnapshot<List<List<dynamic>>> snapshot,
                      ) {
                        // if (snapshot.hasData == true) {
                        //   snapshot.data!.clear();
                        //   // snapshot.data!.add(controller.newList.value);
                        // }

                        if (snapshot.hasData == true) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      width: 270,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 12,
                                                  top: 15,
                                                ),
                                                child: Text(
                                                  // 0 1
                                                  // 1 1
                                                  controller.indexKey.value >=
                                                          controller
                                                                  .keyInserts
                                                                  .value
                                                                  .length -
                                                              1
                                                      ? "nome: ${controller.keyInserts.value[controller.indexKey.value]}"
                                                      : "nome: ${controller.keyInserts.value[controller.indexKey.value++]}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 12,
                                                  top: 10,
                                                  bottom: 10,
                                                ),
                                                child: Text(
                                                  controller.indexValue.value >=
                                                          controller
                                                                  .valueInserts
                                                                  .value
                                                                  .length -
                                                              1
                                                      ? "valor: R\$ ${controller.valueInserts.value[controller.indexValue.value]}"
                                                      : "valor: R\$ ${controller.valueInserts.value[controller.indexValue.value++]}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: IconButton(
                                                onPressed: () => null,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 205, 205),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                    // Text(
                                    //   "${snapshot.data.toString()}\n",
                                    //   style: TextStyle(
                                    //     fontSize: 20,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
