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
        child: SizedBox(
          height: noticeModel.urlToImage == "null" ? 150 : 300,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              noticeModel.urlToImage == "null"
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 150,
                      width: 360,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          noticeModel.urlToImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Container(
                height: noticeModel.title.length < 80 ? 100 : 140,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: noticeModel.urlToImage == "null"
                      ? BorderRadiusDirectional.circular(20)
                      : BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(20),
                          bottomStart: Radius.circular(20),
                        ),
                  color: Color(
                    (Random().nextDouble() * 0xFFFFFF).toInt(),
                  ).withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
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
                          fontSize: 14,
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
