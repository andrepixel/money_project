import 'package:dio/dio.dart';
import 'package:money_project/app/notices/data/notice_model.dart';
import 'package:money_project/app/notices/domain/repositories/i_get_notices_repository.dart';

const apiKey = "a8a1ef7991f84e70abfef87fdadd568f";
const url =
    "https://newsapi.org/v2/top-headlines?category=business&country=br&By=popularity&sortBy=publishedAt&apiKey=${apiKey}";

class GetNoticesRepository implements IGetNoticesRepository {
  Future<List<NoticeModel>> getHTTP() async {
    final Response<dynamic> response = await Dio().get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    final List<dynamic> responseList = response.data.entries.last.value;

    final List<NoticeModel> noticeModelList = List.filled(
      responseList.length,
      NoticeModel(
        name: "",
        title: "",
        url: "",
        urlToImage: "",
      ),
    );

    NoticeModel modelData;

    for (var i = 0; i < responseList.length; i++) {
      modelData = NoticeModel(
        name: responseList[i]['source']['name'].toString(),
        title: responseList[i]['title'].toString(),
        url: responseList[i]['url'].toString(),
        urlToImage: responseList[i]['urlToImage'].toString(),
      );

      noticeModelList[i] = modelData;
    }

    return noticeModelList;
  }
}
