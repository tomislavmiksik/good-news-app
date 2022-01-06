import 'package:flutter/material.dart';

class ArticleProvider with ChangeNotifier {
  String? id;
  String? name;
  Object? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  bool isFavorite;

  ArticleProvider({
    required this.id,
    required this.name,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }


}
