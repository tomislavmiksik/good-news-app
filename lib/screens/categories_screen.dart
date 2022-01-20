import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:news_app/widgets/article_tile.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routePath = '/categories';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late List<ArticleProvider> _articles = [];

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return ListenableProvider(
          create: (BuildContext context) => _articles[index],
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ArticleTile(
              article: _articles[index],
            ),
          ),
        );
      },
      itemCount: _articles.length,
    );
  }

  @override
  void initState() {
    var newsApiServiceProvider =
        Provider.of<NewsApiService>(context, listen: false);
    _articles = newsApiServiceProvider.articles;
    setState(
      () {
        _articles = _articles.toSet().toList();
        _articles.shuffle();
      },
    );
    super.initState();
  }

}
