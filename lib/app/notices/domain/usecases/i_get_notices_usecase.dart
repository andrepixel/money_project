import 'package:money_project/app/notices/data/notice_model.dart';

abstract class IGetNoticesUsecase {
  Future<List<NoticeModel>> GetNotices();
}
