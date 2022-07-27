// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:money_project/app/notices/data/notice_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class HandlerNoticeWidget extends StatelessWidget {
  final NoticeModel noticeModel;

  const HandlerNoticeWidget({
    Key? key,
    required this.noticeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      child: GestureDetector(
        onTap: () async {
          await launchUrl(
            Uri.parse(noticeModel.url),
          );
        },
        child: Container(
          height: 350,
          width: 500,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  noticeModel.urlToImage,
                  fit: BoxFit.contain,
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20),
                    bottomStart: Radius.circular(20),
                  ),
                  color: Color(
                    (Random().nextDouble() * 0xFFFFFF).toInt(),
                  ).withOpacity(0.6),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        "fonte: ${noticeModel.name}",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          wordSpacing: 0.3,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        noticeModel.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          wordSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
