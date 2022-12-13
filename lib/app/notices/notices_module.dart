import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/notices/presenter/notice_controller.dart';
import 'package:money_project/app/notices/presenter/notices_page.dart';

class NoticesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => NoticeController())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => NoticesPage(),
    )
  ];
}
