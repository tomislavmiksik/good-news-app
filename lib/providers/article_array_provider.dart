/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/news_api_service.dart';
import 'package:provider/provider.dart';

class ArticleArrayProvider with ChangeNotifier {
  late List<ArticleProvider> _articles = [];
  late List<dynamic> _data = [];
  
  List<ArticleProvider> get articles {
    return [..._articles];
  }

  BuildContext ctx;
  ArticleArrayProvider(this.ctx);

  void loadArticles() async {
    final newsApiServiceProvider =
        Provider.of<NewsApiService>(ctx, listen: false);
    print('loada neki kurac');
    var url = newsApiServiceProvider.topHeadlinesUrl;

    http.get(url).then(
      (value) {
        _data.addAll(json.decode(value.body)['articles']);

        for (var element in _data) {
          print(element);
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
    print(_articles);
  }

  List<ArticleProvider> get articlesList {
    print(_articles);
    return [..._articles];
  }
}
 */