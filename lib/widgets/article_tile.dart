import 'package:flutter/material.dart';
import 'package:news_app/providers/article_provider.dart';
import 'package:news_app/screens/article_detail_screen.dart';
import 'package:provider/provider.dart';

class ArticleTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ArticleProvider article =
        Provider.of<ArticleProvider>(context, listen: false);

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
      /* decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ), */
      child: GestureDetector(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                //clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,

                  //not a perfect solution, but it works
                  child: Image.network(
                    article.urlToImage.toString(),
                    fit: BoxFit.cover,
                    height: 70,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/images/placeholder1.png"),
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: article.author != null
                            ? Text(
                                article.author.toString(),
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                              )
                            : Container(),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          article.title.toString(),
                          maxLines: 2,
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
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ArticleDetailScreen.routePath);
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
              width: MediaQuery.of(context).size.width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
