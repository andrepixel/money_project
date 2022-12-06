import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/commons/widgets/component_pop_widget.dart';

class GlobalMenuOutputPage extends StatefulWidget {
  const GlobalMenuOutputPage({Key? key}) : super(key: key);

  @override
  State<GlobalMenuOutputPage> createState() => _GlobalMenuOutputPageState();
}

class _GlobalMenuOutputPageState extends State<GlobalMenuOutputPage> {
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
              title: "Menu Visualização",
              path: "home",
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
                              Colors.blue.shade500,
                            ),
                          ),
                          onPressed: () => Modular.to.pushNamed("outputmenu"),
                          icon: Icon(
                            Icons.add_chart,
                            color: Colors.white,
                            size: 40,
                          ),
                          label: Text(
                            "Gráfico 1",
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
                        "Visualize as suas inserções, com o 1° modelo de gráfico!",
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
                              Colors.purple.shade500,
                            ),
                          ),
                          onPressed: () => Modular.to.pushNamed("outputmenu2"),
                          icon: Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: 40,
                          ),
                          label: Text(
                            "Gráfico 2",
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
                        "Visualize as suas inserções, com o 2° modelo de gráfico!",
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
