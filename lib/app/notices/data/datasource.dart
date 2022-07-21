// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

const apiKey = "a8a1ef7991f84e70abfef87fdadd568f";

class Datasource {
  void getHTTP() async {
    final Response<dynamic> response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?category=business&country=br&By=popularity&apiKey=${apiKey}");
    final notice = Notice();
    final Map<String, dynamic> result2 = response.data;
    final Map<String, dynamic> a = result2.entries.last.value[3];

    // notice.url = a.values.elementAt(4).toString();
    final String b = a.values.elementAt(4).toString();
    var valorL = 0;
    var position = 0;
    for (var i = 0; i < b.length; i++) {
      if (valorL == 2) {
        position = i;
      }

      if (b[i] == "/") {
        valorL++;
      }
    }
    // print("\n${position}");

    notice.urlView = a.values.elementAt(4).toString().substring(0, position+1);
    // notice.urlImage = a.values.elementAt(5).toString();
    notice.title = a.values.elementAt(2).toString();
    notice.datePublised = a.values
        .elementAt(6)
        .toString()
        .substring(0, a.values.elementAt(6).toString().lastIndexOf("T"));

    print(notice.url);
    print(notice.urlView);
    print(notice.urlImage);
    print(notice.title);
    print(notice.datePublised);
  }
}

class Notice {
  String url;
  String urlView;
  String urlImage;
  String title;
  String datePublised;

  Notice({
    this.url = "",
    this.urlView = "",
    this.urlImage = "",
    this.title = "",
    this.datePublised = "",
  });
}

void main(List<String> args) {
  final data = Datasource();

  data.getHTTP();
}
