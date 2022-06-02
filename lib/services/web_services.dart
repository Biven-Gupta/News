import 'package:dio/dio.dart';

import '../models/news_article.dart';
import '../utils/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadlinesByCountry(String country) async {
    String url = Constants.headlinesFor(country);
    //response= dio.get(Constants.headlinesFor(country));
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed To Fetch News');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = Constants.TOP_HEADLINES_URL;
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      //print(list);
      //list.map((article) => NewsArticle.fromJson(article)).toList();
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed To Fetch News');
    }
  }
}
