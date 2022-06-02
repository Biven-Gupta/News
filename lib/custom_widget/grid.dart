import 'package:flutter/material.dart';
import 'package:news/screens/news_details.dart';

import '../view_models/news_article_VM.dart';
import 'circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({required this.articles});

  /*Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return NewsDetails(
                article: article,
              );
            }));
          },
          child: GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(imageUrl: article.imageUrl),
            ),
            footer: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title == null
                    ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                    : article.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
