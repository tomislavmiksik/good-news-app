import 'package:flutter/material.dart';
//import 'package:news_app/providers/article_provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routePath = '/article-detail-screen';

  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article Detail',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
