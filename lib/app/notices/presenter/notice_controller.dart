import 'package:money_project/app/notices/data/get_notices_repository.dart';
import 'package:money_project/app/notices/data/notice_model.dart';

class NoticeController {
  final GetNoticesRepository repository = GetNoticesRepository();

  Future<List<NoticeModel>> getNotices() async {
    final list = await repository.getHTTP();

    return list;
  }
}
