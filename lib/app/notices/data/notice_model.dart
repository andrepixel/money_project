// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';

class NoticeModel{
  final String name;
  final String title;
  final String url;
  final String urlToImage;

  const NoticeModel({
    required this.name,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  NoticeModel copyWith({
    String? name,
    String? title,
    String? url,
    String? urlImage,
  }) {
    return NoticeModel(
      name: name ?? this.name,
      title: title ?? this.title,
      url: url ?? this.url,
      urlToImage: urlImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'url': url,
      'urlImage': urlToImage,
    };
  }

  factory NoticeModel.fromMap(Map<String, dynamic> map) {
    return NoticeModel(
      name: map['name'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      urlToImage: map['urlImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticeModel.fromJson(String source) =>
      NoticeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NoticeModel(name: $name, title: $title, url: $url, urlImage: $urlToImage)';
  }

  @override
  bool operator ==(covariant NoticeModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.title == title &&
        other.url == url &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode {
    return name.hashCode ^ title.hashCode ^ url.hashCode ^ urlToImage.hashCode;
  }
}
