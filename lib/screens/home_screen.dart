import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/widgets/article_tile.dart';
import 'package:provider/provider.dart';

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
    setState(
      () {
        _isLoading = true;
      },
    );

    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=gb&apiKey=715fc7f2d8ec4dcbb568b123fd10a7f0');
    http.get(url).then(
      (value) {
        _data.addAll(json.decode(value.body)['articles']);

        for (var element in _data) {
          _articles.add(
            ArticleProvider(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url'],
              author: element['author'],
              publishedAt: element['publishedAt'],
              source: element['source'],
              name: element['source']['name'],
              id: element['source']['id'],
            ),
          );
        }
        if (mounted) {
          setState(
            () {
              _isLoading = false;
            },
          );
        }
      },
    );
    //print(_data.length);
    super.initState();
  }

  @override
  void dispose() {
    //if(!mounted) return;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
/* 
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    itemBuilder: (BuildContext ctx, index) {
                      return const Center(
                        child: Text(
                          "WIP",
                        ),
                      );
                    },
                    itemCount: _articles.length,

                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ), */
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    kBottomNavigationBarHeight -
                    MediaQuery.of(context).padding.top,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
/*               print(_articles[index].title.toString() +
                        ' ' +
                        _articles[index].url.toString()); */
                    return ChangeNotifierProvider.value(
                      value: _articles[index],
                      child: ArticleTile(),
                    );
                  },
                  itemCount: _data.length,
                ),
              ),
            ],
          );
  }
}
