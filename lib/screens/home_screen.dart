import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:news_app/widgets/headline_article_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = '/home-screen';

  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ArticleProvider> _articles = [];
  late var newsApiServiceProvider;
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
        : RefreshIndicator(
            backgroundColor: const Color(0xFF03071e),
            color: const Color(0xFFf77f00),
            onRefresh: () async {
              setState(
                () {
                  //newsApiServiceProvider.fetchArticles();
                  _articles = newsApiServiceProvider.articles;
                  _articles.shuffle();
                },
              );
            },
            child: ListView.builder(
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
            ),
          );
  }

  @override
  void initState() {
    setState(
      () {
        _isLoading = true;
      },
    );

    newsApiServiceProvider =
        Provider.of<NewsApiService>(context, listen: false);

    newsApiServiceProvider.fetchArticles();
    _articles = newsApiServiceProvider.articles;
    setState(
      () {
        _articles = _articles.toSet().toList();
        _articles.shuffle();
        _isLoading = false;
      },
    );

    super.initState();
  }
}
