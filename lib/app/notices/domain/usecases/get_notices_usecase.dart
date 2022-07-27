// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:money_project/app/notices/data/notice_model.dart';

import 'package:money_project/core/commons/errors.dart';
import 'package:money_project/app/notices/domain/repositories/i_get_notices_repository.dart';
import 'package:money_project/app/notices/domain/usecases/i_get_notices_usecase.dart';

class GetNoticesUsecase implements IGetNoticesUsecase {
  final IGetNoticesRepository repository;

  GetNoticesUsecase({
    required this.repository,
  });

  @override
  Future<List<NoticeModel>> GetNotices() {
    return repository.getHTTP();
  }
}
