import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/notices/data/notice_model.dart';
import 'package:money_project/app/notices/presenter/handler_notice_widget.dart';
import 'package:money_project/app/notices/presenter/notice_controller.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({Key? key}) : super(key: key);

  @override
  State<NoticesPage> createState() => _NoticesPageState();
}

class _NoticesPageState extends ModularState<NoticesPage, NoticeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Notícias",
              path: "/",
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: controller.getNotices().then((value) => value[index]),
                  builder: (context, snapshot) => snapshot.data != null
                      ? HandlerNoticeWidget(
                          noticeModel: snapshot.data as NoticeModel)
                      : SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
