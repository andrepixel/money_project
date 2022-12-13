import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/commons/widgets/component_pop_widget.dart';

class MenuRemovePage extends StatefulWidget {
  const MenuRemovePage({Key? key}) : super(key: key);

  @override
  State<MenuRemovePage> createState() => _MenuRemovePageState();
}

class _MenuRemovePageState extends State<MenuRemovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Menu Remoção",
              path: "/inserts/",
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
                              Colors.red,
                            ),
                          ),
                          onPressed: () => Modular.to.pushNamed("singleremove"),
                          icon: Icon(
                            Icons.event_busy,
                            color: Colors.red.shade100,
                            size: 40,
                          ),
                          label: Text(
                            "Inserção",
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
                        "Você precisa remover somente uma inserção por vez? Botão acima irá te ajudar!",
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
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
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
                              Colors.red,
                            ),
                          ),
                          onPressed: () => Modular.to.pushNamed("allremove"),
                          icon: Icon(
                            Icons.dynamic_feed,
                            color: Colors.red.shade100,
                            size: 40,
                          ),
                          label: Text(
                            "Inserções",
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
                        "Você precisa remover todas as inserção de um mês? Botão acima irá te ajudar!",
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
