// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FieldMultipleChoicesWidget extends StatefulWidget {
  final String nameField;
  List<String> listObjects;
  String initialValue;
  ValueNotifier<String> variableController;
  bool isTypeInsertion;

  FieldMultipleChoicesWidget({
    Key? key,
    required this.nameField,
    required this.listObjects,
    required this.initialValue,
    required this.variableController,
    this.isTypeInsertion = false,
  }) : super(key: key);

  @override
  State<FieldMultipleChoicesWidget> createState() =>
      _FieldMultipleChoicesWidgetState();
}

class _FieldMultipleChoicesWidgetState
    extends State<FieldMultipleChoicesWidget> {
  @override
  Widget build(BuildContext context) {
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              value: widget.initialValue,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              ),
              underline: SizedBox(),
              items: widget.listObjects.map(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(
                  () {
                    if (widget.isTypeInsertion == true) {
                      value == "Gasto"
                          ? widget.variableController.value = "-"
                          : widget.variableController.value = "+";
                    }

                    widget.initialValue = value!;

                    if (widget.initialValue == value) {
                      widget.variableController.value = widget.initialValue;
                    } else {
                      widget.variableController.value = value;
                    }

                    print("---- ${widget.variableController.value}");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
