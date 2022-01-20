import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:http/http.dart' as http;

class NewsApiService with ChangeNotifier {
  static const apiKey = '715fc7f2d8ec4dcbb568b123fd10a7f0';
  late List<ArticleProvider> _articles = [];
  final List<String> _categoriesList = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  //'https://newsapi.org/v2/everything?q=soccer&apiKey=715fc7f2d8ec4dcbb568b123fd10a7f0'

  Uri get topHeadlinesUrlPrimary {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=gb&apiKey=$apiKey');
  }

  Uri topHeadlinesUrl(String category) {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=gb&category=$category&apiKey=$apiKey');
  }

  Map<String, String> get categories {
    return {
      'business': 'business',
      'entertainment': 'entertainment',
      'general': 'general',
      'health': 'health',
      'science': 'science',
      'sports': 'sports',
      'technology': 'technology',
    };
  }

  Future<List<ArticleProvider>> fetchArticles() async {
    //final _data = json.decode(response.body) as Map<String, dynamic>;
    //List<ArticleProvider> _articles = [];
    late final List<dynamic> _data = [];

    //print(element);
    try {
      categories.forEach((key, value) async {
        var url = topHeadlinesUrl(value);
        await http.get(url).then((value) {
          _data.clear();
          print(json.decode(value.body)['code']);
          //if(json.decode(value.body)[0] == null) return;
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
        });
      });
      print(_articles.length);
      _articles = _articles.toSet().toList();
      return _articles;
    } catch (e) {
      rethrow;
    }
  }

  List<ArticleProvider> get articles {
    _articles = _articles.toSet().toList();
    return [..._articles];
  }

  List<String> get categoriesList {
    return _categoriesList;
  }
}
