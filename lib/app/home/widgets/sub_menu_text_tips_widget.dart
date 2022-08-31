import 'package:flutter/material.dart';

class SubMenuTextTipsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const SubMenuTextTipsWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 25,
              left: 5,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
