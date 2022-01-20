import 'dart:convert';

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
  ArticleArrayProvider(this._articles);

 
}
