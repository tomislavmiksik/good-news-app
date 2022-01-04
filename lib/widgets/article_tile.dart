import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:provider/provider.dart';

class ArticleTile extends StatelessWidget {
  final ArticleProvider article;

  ArticleTile({required this.article});

  @override
  Widget build(BuildContext context) {
    //final ArticleProvider article = Provider.of<ArticleProvider>(context, listen: false);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Text(article.title),
      ),
    );
  }
}
