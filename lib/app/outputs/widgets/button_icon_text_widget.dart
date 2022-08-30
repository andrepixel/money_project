// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonIconTextWidget extends StatelessWidget {
  final String isOutput;

  const ButtonIconTextWidget({
    Key? key,
    required this.isOutput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      Colors.grey.shade400,
                    ),
                  ),
                  onPressed: () => isOutput == "false"
                      ? Modular.to.pushNamed("outputPage/", arguments: isOutput)
                      : Modular.to
                          .pushNamed("outputPage/", arguments: isOutput),
                  icon: isOutput == "false"
                      ? Icon(
                          Icons.show_chart,
                          color: Colors.green,
                          size: 40,
                          textDirection: TextDirection.ltr,
                        )
                      : Icon(
                          Icons.show_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                  label: isOutput == "false"
                      ? Text(
                          "Entradas",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        )
                      : Text(
                          "Saídas",
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
              child: isOutput == "false"
                  ? Text(
                      "Que tal saber, os seus lucros?\nO gráfico de entradas, mostra o que realmente entra para o seu bolso,\nem cada mês.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    )
                  : Text(
                      "Será que vocês está gastando muito? O gráfico de saídas, mostra o que realmente sai do seu bolso, em cada mês.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
