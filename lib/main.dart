import 'package:flutter/material.dart';
import 'package:news_app/providers/article_array_provider.dart';
import 'package:news_app/screens/article_detail_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/profile_screen.dart';
import 'package:news_app/screens/tabs_screen.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewsApiService(),
        ),
/*         ChangeNotifierProvider(
          create: (ctx) => ArticleArrayProvider(ctx),
        ), */
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => const TabsScreen(),
          HomeScreen.routePath: (ctx) => HomeScreen(),
          ProfileScreen.routePath: (ctx) => ProfileScreen(),
          ArticleDetailScreen.routePath: (ctx) => ArticleDetailScreen(),
        },
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
