import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/widgets/article_tile.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = '/home-screen';

  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> _data = [];
  late List<ArticleProvider> _articles = [];
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=715fc7f2d8ec4dcbb568b123fd10a7f0');
    http.get(url).then((value) {
      _data.addAll(json.decode(value.body)['articles']);

      for (var element in _data) {
        _articles.add(ArticleProvider(
          title: element['title'],
          description: element['description'],
          urlToImage: element['urlToImage'],
          url: element['url'],
          author: element['author'],
          publishedAt: element['publishedAt'],
          source: element['source'],
        ));
      }
      setState(() {
        _isLoading = false;
      });
    });
    //print(_data.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ArticleTile(
                article: _articles[index],
              );
            },
            itemCount: _data.length,
          );
  }
}
