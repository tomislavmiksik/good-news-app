import 'package:flutter/material.dart';
import 'package:news_app/providers/article_array_provider.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/screens/article_detail_screen.dart';
import 'package:news_app/screens/categories_screen.dart';
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
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => const TabsScreen(),
          HomeScreen.routePath: (ctx) => HomeScreen(),
          CategoriesScreen.routePath: (ctx) => CategoriesScreen(),
          ProfileScreen.routePath: (ctx) => ProfileScreen(),
          ArticleDetailScreen.routePath: (ctx) => ArticleDetailScreen(),
        },
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                fontFamily: 'Montserrat',
              ),
          primaryColor: const Color(0xFFF8F8F8),
          indicatorColor: const Color(0xfff77f00),
          backgroundColor: const Color(0xFF03071e),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
