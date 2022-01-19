import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/providers/article_array_provider.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:news_app/widgets/article_tile.dart';
import 'package:news_app/widgets/category_badge.dart';
import 'package:news_app/widgets/headline_article_list.dart';
import 'package:news_app/widgets/headline_article_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = '/home-screen';

  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<dynamic> _data = [];
  late List<ArticleProvider> _articles = [];
  late final List<String> _categories = [];

  var _isLoading = false;
  String currentCategory = 'general';

  @override
  void dispose() {
    //if(!mounted) return;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFf77f00),
            ),
          )
        /* : Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.337 -
                    kBottomNavigationBarHeight -
                    MediaQuery.of(context).padding.top,
                child: HeadlineArticleList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.595 -
                    kBottomNavigationBarHeight -
                    MediaQuery.of(context).padding.top,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                      value: _articles[index],
                      child: ArticleTile(),
                    );
                  },
                  itemCount: _data.length,
                ),
              ),
            ],
          ); */
        : ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HeadlineArticleTile(
                  article: _articles[index],
                ),
              );
            },
            itemCount: _articles.length,
          );
  }

  @override
  void initState() {
    setState(
      () {
        _isLoading = true;
      },
    );

    final newsApiServiceProvider =
        Provider.of<NewsApiService>(context, listen: false);

    _categories.addAll(newsApiServiceProvider.categoriesList);

    for (var element in _categories) {
      print(element);
      var url = newsApiServiceProvider.topHeadlinesUrl(element);
      print(url);

      http.get(url).then((value) {
        _data.clear();
        print(json.decode(value.body)['code']);
        if(json.decode(value.body)[0] == null) return;
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
      }).then(
        (value) => setState(
          () {
            _articles = _articles.toSet().toList();

            _isLoading = false;
          },
        ),
      );
    }

    print(_articles.length);
    _articles = _articles.toSet().toList();
    super.initState();
  }
}
