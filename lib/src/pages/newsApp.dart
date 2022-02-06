import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';
import 'package:flutter_news_app/src/pages/About%20us/About%20us.dart';
import 'package:flutter_news_app/src/pages/Test/Test.dart';
import 'package:flutter_news_app/src/pages/Login/Login.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';


class NewsApp extends StatefulWidget {
  NewsApp({Key key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Login(),
          HomePage(),
          Test(),
          ProfilePage(),
          AboutUS(),
        ],
      ),
    );
  }
}
