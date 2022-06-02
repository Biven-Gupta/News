import 'package:flutter/material.dart';
import 'package:news/custom_widget/grid.dart';
import 'package:news/utils/constants.dart';
import 'package:news/view_models/news_article_list_VM.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  String? country;
  String? code;

  NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String country = "India";
  String code = "in";
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListVM>(context, listen: false).topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsArticleListVM>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            padding: const EdgeInsets.only(right: 8.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            onSelected: (country) {
              provider.topHeadLinesByCountry(Constants.Countries[country]!);
            },
            tooltip: 'Various Countries',
            offset: const Offset(30, 40),
            color: const Color(0xffeeeffd),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((e) => PopupMenuItem(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        value: e,
                        child: Text(e),
                      ))
                  .toList();
            },
            icon: const Icon(
              Icons.more_vert,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          shrinkWrap: false,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/flags/$code.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: null,
                ),
                ListTile(
                  horizontalTitleGap: -10,
                  title: Text(
                    country,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const Icon(Icons.location_on_rounded),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: Constants.Countries.keys.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    Constants.Countries.keys.toList()[index],
                  ),
                  onTap: () {
                    setState(() {
                      country = Constants.Countries.keys.toList()[index];
                      code = Constants.Countries.values.toList()[index];
                    });
                    provider.topHeadLinesByCountry(
                        Constants.Countries.values.toList()[index]);
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.location_on),
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(
                        'assets/flags/${Constants.Countries.values.toList()[index]}.png'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
            // ListTile(
            //   title: const Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const Divider(
                color: Colors.orangeAccent,
                height: 40,
                thickness: 10,
                indent: 20,
                endIndent: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  'HeadLines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(child: NewsGrid(articles: provider.articles))
            ],
          ),
        ),
      ),
    );
  }
}
