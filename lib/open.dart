import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/screens/news_screen.dart';
import 'package:news/view_models/news_article_list_VM.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MultiProvider _navigator() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsArticleListVM(),
        )
      ],
      child: NewsScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => _navigator())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFADC77),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Image(
                      image: AssetImage('assets/images/splash.png'),
                    ),
                  ),
                  /*Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),*/
                  Padding(
                    padding: EdgeInsets.only(top: 400, left: 120),
                    child: Text(
                      'NEWS...',
                      style: TextStyle(
                          color: Color(0xFFFDFEDE),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              /*const CircularProgressIndicator(
                backgroundColor: Color(0xFFFDFEDE),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.orangeAccent,
                ),
              ),*/
              SpinKitChasingDots(
                size: 100,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.isEven
                          ? Color(0xFFFDFEDE)
                          : Colors.orangeAccent,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
