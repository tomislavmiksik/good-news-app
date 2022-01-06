import 'package:flutter/material.dart';

class NewsApiService with ChangeNotifier {
  static const apiKey = '715fc7f2d8ec4dcbb568b123fd10a7f0';
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

  Uri get topHeadlinesUrl {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');
  }

  Uri everythingUrl(String category) {
    return Uri.parse(
        'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey');
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

  List<String> get categoriesList {
    return _categoriesList;
  }
}
