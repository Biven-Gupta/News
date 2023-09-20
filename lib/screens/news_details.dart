import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/view_models/news_article_VM.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../custom_widget/circle_image.dart';

class NewsDetails extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsDetails({Key? key, required this.article}) : super(key: key) {
    // launcher
    //     .launchUrl(Uri.parse('https://google.com'))
    //     .then((value) => debugPrint('can launch $value'));
  }

  @override
  Widget build(BuildContext context) {
    print(article);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/news01.png'),
            ),
            const SizedBox(width: 10),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.author == null || article.author == "" ? 'Anonymous' : article.author!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: <Widget>[
                  const Stack(
                    children: <Widget>[
                      Divider(
                        color: Colors.orangeAccent,
                        height: 40,
                        thickness: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Text(
                          'HeadLines',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    article.title == null || article.title == ""
                        ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                        : article.title!,
                    style: TextStyle(
                      wordSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.publishAt == null ? '2022' : article.publishAt!,
                    //textAlign: Alignment.,
                    style: TextStyle(
                      wordSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: CircleImage(
                      imageUrl: article.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          wordSpacing: 3,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Color(0xfffefdfd),
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: article.url == null ? 'https://news.google.com' : article.url!,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launcher.launchUrl(Uri.parse(article.url!));
                              },
                          ),
                        ]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.description ?? "For more info, Open Url",
                    style: const TextStyle(
                      fontSize: 16,
                      wordSpacing: 3,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
