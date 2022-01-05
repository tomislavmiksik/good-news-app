import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routePath = '/article-detail-screen';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Detail'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(child: Text('test'),),
    );
  }
}
