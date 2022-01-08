import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:news_app/providers/article_provider.dart';
//import 'package:news_app/providers/article_provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routePath = '/article-detail-screen';

  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article =
        ModalRoute.of(context)?.settings.arguments as ArticleProvider;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF03071e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          article.name.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff77f00),
        onPressed: () {
          openWebPage(article);
        },
        child: const Icon(Icons.open_in_new),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: ExtendedImage.network(
                article.urlToImage.toString(),
                fit: BoxFit.cover,
                cache: true,
                height: 300,
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
                        child: Image.asset("assets/images/placeholder1.png"),
                      );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                article.title.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            article.author != null
                ? Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'by ${article.author.toString()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                : Container(),
            const Divider(
              color: Color(0xfff77f00),
            ),
            InkWell(
              onTap: () {
                openWebPage(article);
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  article.url.toString(),
                  style: const TextStyle(
                    color: Color(0xfff77f00),
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            article.description != null
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      article.description.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                : Container(),
            article.content != null ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                article.content.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }

  openWebPage(article) {
    FlutterWebBrowser.openWebPage(
      url: article.url.toString(),
      customTabsOptions: const CustomTabsOptions(
        shareState: CustomTabsShareState.on,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: const SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.green,
        preferredControlTintColor: Colors.amber,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }
}
