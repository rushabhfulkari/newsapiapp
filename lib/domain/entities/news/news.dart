class NewsEntity {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String sourceId;
  final String sourceName;

  NewsEntity(
      {required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.sourceId,
      required this.sourceName});
}
