import 'package:flutter/material.dart';
import 'package:news/open.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff988989)),
        scaffoldBackgroundColor: const Color(0xfffefdfd),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: Color(0xfffefdfd),
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
