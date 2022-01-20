import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/screens/article_detail_screen.dart';
import 'package:provider/provider.dart';

class ArticleTile extends StatelessWidget {
  ArticleTile({Key? key, required ArticleProvider article})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final ArticleProvider article =
        Provider.of<ArticleProvider>(context);

    Widget checkUrl(String url) {
      try {
        return Image.network(url, height: 70.0, width: 70.0, fit: BoxFit.cover);
      } catch (e) {
        return Image.asset('assets/images/no_image.png',
            height: 70.0, width: 70.0, fit: BoxFit.cover);
      }
    }

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ArticleDetailScreen.routePath, arguments: article);
        },
        highlightColor: const Color(0xfff77f00),
        splashColor: const Color(0xfff77f00),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                //clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ExtendedImage.network(
                    article.urlToImage.toString(),
                    fit: BoxFit.cover,
                    cache: true,
                    height: 70,
                    loadStateChanged: (state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFff77f00),
                            ),
                          );
                        case LoadState.completed:
                          return ExtendedRawImage(
                            image: state.extendedImageInfo?.image,
                            fit: BoxFit.cover,
                          );
                        case LoadState.failed:
                          return Center(
                            child:
                                Image.asset("assets/images/placeholder1.png"),
                          );
                      }
                    },
                  ),
                ),
              ),
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          article.name.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          article.title.toString(),
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: IconButton(
                icon: article.saved
                    ? const Icon(
                        Icons.favorite,
                        color: Color(0xfff77f00),
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Color(0xfff77f00),
                      ),
                onPressed: () {
                  article.toggleSaved();
                },
              ),
            ),
            /* SizedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ArticleDetailScreen.routePath,
                      arguments: article);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xfff77f00),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.1,
            ), */
          ],
        ),
      ),
    );
  }
}
