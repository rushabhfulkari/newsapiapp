import 'package:newsapiapp/domain/entities/news/news.dart';

class NewsModel {
  String? title;
  String? author;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  String? sourceId;
  String? sourceName;

  NewsModel(
      {required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.sourceId,
      required this.sourceName});

  NewsModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    author = data['author'];
    description = data['description'];
    url = data['url'];
    urlToImage = data['urlToImage'];
    publishedAt = data['publishedAt'];
    content = data['content'];
    sourceId = data['source']['id'];
    sourceName = data['source']['name'];
  }
}

extension NewsModelX on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      title: title ?? "",
      author: author ?? "",
      description: description ?? "",
      url: url ?? "",
      urlToImage: urlToImage ?? "",
      publishedAt: publishedAt ?? "",
      content: content ?? "",
      sourceId: sourceId ?? "",
      sourceName: sourceName ?? "",
    );
  }
}
