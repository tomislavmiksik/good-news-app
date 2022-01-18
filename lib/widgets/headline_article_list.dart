import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:provider/provider.dart';
import 'headline_article_tile.dart';

class HeadlineArticleList extends StatefulWidget {
  HeadlineArticleList({Key? key}) : super(key: key);

  @override
  _HeadlineArticleListState createState() => _HeadlineArticleListState();
}

class _HeadlineArticleListState extends State<HeadlineArticleList> {
  late final List<dynamic> _data = [];
  late final List<ArticleProvider> _articles = [];

  @override
  void initState() {
    final newsApiServiceProvider =
        Provider.of<NewsApiService>(context, listen: false);


    var url = newsApiServiceProvider.topHeadlinesUrl('sports');

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
      },
    );
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return HeadlineArticleTile(article: _articles[index]);
      },
      itemCount: _articles.length,
    );
  }
}
