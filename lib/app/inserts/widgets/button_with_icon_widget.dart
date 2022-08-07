// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonWithIconWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color colorButton;
  final Color colorIcon;
  final Color colorLabel;
  void Function() myFunction;

  ButtonWithIconWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.colorButton,
    required this.colorIcon,
    required this.colorLabel,
    required this.myFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        5,
      ),
      child: Container(
        height: 50,
        width: 160,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: TextButton.icon(
          onPressed: myFunction,
          icon: Icon(
            icon,
            color: colorIcon,
            size: 30,
          ),
          label: Text(
            label,
            style: TextStyle(
              color: colorLabel,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          style: ButtonStyle(),
        ),
      ),
    );
  }
}
