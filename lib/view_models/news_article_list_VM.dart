import 'package:flutter/material.dart';
import 'package:news/models/news_article.dart';
import 'package:news/services/web_services.dart';
import 'package:news/view_models/news_article_VM.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListVM with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void topHeadLinesByCountry(String country) async {
    List<NewsArticle> newsArticle =
        await WebService().fetchTopHeadlinesByCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  void topHeadLines() async {
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
