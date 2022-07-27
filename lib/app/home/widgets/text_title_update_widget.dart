import 'package:flutter/material.dart';

class TextTitleUpdateWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const TextTitleUpdateWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Icon(Icons.mood)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.transparent,
        ),
      ],
    );
  }
}

