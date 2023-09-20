class NewsArticle {
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? publishAt;
  final String? content;

  NewsArticle(
      {required this.title,
      required this.author,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.publishAt,
      required this.content});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    //print(json);
    return NewsArticle(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      publishAt: json['publishedAt'],
      content: json['content'],
    );
  }

  @override
  String toString() {
    return 'NewsArticle{title: $title, author: $author, description: $description, urlToImage: $urlToImage, url: $url, publishAt: $publishAt, content: $content}';
  }
}
