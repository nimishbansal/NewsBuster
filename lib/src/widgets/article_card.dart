import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

/// Card for displaying a news article.
class ArticleCard extends StatefulWidget {
  final Article article;

  const ArticleCard({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.orangeAccent,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          if (widget.article != null && widget.article.articleUrl != null) {
            launch(widget.article.articleUrl, forceWebView: true,enableJavaScript: true);
          }
        },
        child: Container(
          height: 0.30 * MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: widget.article == null
                    ? Shimmer.fromColors(
                        baseColor: Color(0xFFe2e2e2),
                        highlightColor: Colors.white,
                        child: Wrap(
                          children: [
                            Container(
                              height: 0.34 * MediaQuery.of(context).size.width,
                              width: 0.34 * MediaQuery.of(context).size.width,
                              color: Colors.white70,
                            ),
                          ],
                        ))
                    : Image.network(
                        widget.article.imageUrl,
                        height: 0.34 * MediaQuery.of(context).size.width,
                        width: 0.34 * MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                  height: 0.34 * MediaQuery.of(context).size.width,
                  width: 0.05 * MediaQuery.of(context).size.width),
              Container(
                width: 0.55 * MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.article == null
                        ? Shimmer.fromColors(
                            baseColor: Color(0xFFe2e2e2),
                            highlightColor: Colors.white,
                            child: Container(
                              height: 0.04 * MediaQuery.of(context).size.height,
                              width: 0.5 * MediaQuery.of(context).size.width,
                              color: Colors.white,
                            ),
                          )
                        : Text(widget.article.headline,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                    widget.article == null
                        ? Shimmer.fromColors(
                            baseColor: Color(0xFFe2e2e2),
                            highlightColor: Colors.white,
                            child: Container(
                              height: 0.02 * MediaQuery.of(context).size.height,
                              width: 0.5 * MediaQuery.of(context).size.width,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            widget.article.publisher.name +
                                ' ' +
                                widget.article.publishDate,
                            style: TextStyle(color: Colors.grey),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
