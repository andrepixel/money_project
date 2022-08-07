// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FieldTextWidget extends StatefulWidget {
  final String nameField;
  final bool typeMoney;
  ValueNotifier<String> variableController;
  bool isTypeValue;

  FieldTextWidget({
    Key? key,
    required this.nameField,
    required this.typeMoney,
    required this.variableController,
    this.isTypeValue = false,
  }) : super(key: key);

  @override
  State<FieldTextWidget> createState() => _FieldTextWidgetState();
}

class _FieldTextWidgetState extends State<FieldTextWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 3,
            ),
            height: 30,
            width: 350,
            child: Text(
              widget.nameField,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                wordSpacing: 0.2,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: textEditingController,
              keyboardType:
                  widget.isTypeValue == true ? TextInputType.number : null,
              onChanged: (value) {
                widget.variableController.value = value;
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                hintText: widget.typeMoney != true
                    ? "Escreva o nome da inserção aqui"
                    : "R\$ 0,00",
                contentPadding: EdgeInsets.only(
                  left: 23,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
