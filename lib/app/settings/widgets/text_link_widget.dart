// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextLinkWidget extends StatelessWidget {
  final String text;
  final String url;
  final String subText;

  const TextLinkWidget({
    Key? key,
    required this.text,
    this.url = "",
    this.subText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        children: [
          TextSpan(
            text: subText,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
        style: TextStyle(
          color: url.isEmpty ? Colors.black87 : Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = url.isEmpty
              ? null
              : () async {
                  await launchUrl(
                    Uri.parse(url),
                  );
                },
      ),
    );
  }
}
