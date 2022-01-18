import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/screens/article_detail_screen.dart';

class HeadlineArticleTile extends StatelessWidget {
  final ArticleProvider article;

  HeadlineArticleTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ArticleDetailScreen.routePath, arguments: article);
      },
      highlightColor: const Color(0xfff77f00),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              child: ExtendedImage.network(
                article.urlToImage.toString(),
                fit: BoxFit.cover,
                cache: true,
                enableMemoryCache: true,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                loadStateChanged: (state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case LoadState.completed:
                      return ExtendedRawImage(
                        image: state.extendedImageInfo?.image,
                        fit: BoxFit.cover,
                      );
                    case LoadState.failed:
                      return Center(
                        child: Image.asset("assets/images/placeholder1.png"),
                      );
                  }
                },
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Text(
                article.title.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.white),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
