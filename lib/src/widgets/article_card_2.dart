import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/bookmark_db.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

var _longEmptyString = "..................................................."
    ".........................................";

/// Card for displaying a news article.
class ArticleCard2 extends StatefulWidget {
  final Article article;

  const ArticleCard2({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleCard2State createState() => _ArticleCard2State();
}

class _ArticleCard2State extends State<ArticleCard2> {
  get _isLoaded {
    return widget.article != null;
  }

  @override
  Widget build(BuildContext context) {
    var _cardWidth = 0.91 * MediaQuery.of(context).size.width;
    var _cardHeight = 0.58 * MediaQuery.of(context).size.height;
    var _imageHeight = 0.295 * MediaQuery.of(context).size.height;
    var _cardBottomStripHeight = 0.07 * _cardHeight;
    var _greyColorTextStyle = TextStyle(color: Colors.grey);

    var _cardContainer = Container(
      width: _cardWidth,
      height: _imageHeight,
      child: _isLoaded
          ? Image.network(widget.article.imageUrl, fit: BoxFit.fill)
          : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );

    var _cardImage = !_isLoaded
        ? Shimmer.fromColors(
            child: _cardContainer,
            baseColor: Color(0xFFe2e2e2),
            highlightColor: Colors.white,
          )
        : _cardContainer;

    var _headlineContainer = Container(
      color: Colors.white,
      width: _cardWidth,
      alignment: Alignment.center,
      child: Text(
        _isLoaded ? widget.article.headline : _longEmptyString,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: GoogleFonts.kanit(
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
    );

    var _headline = !_isLoaded
        ? Shimmer.fromColors(
            child: _headlineContainer,
            baseColor: Color(0xFFe2e2e2),
            highlightColor: Colors.white,
          )
        : _headlineContainer;

    var _articleTextIntroContainer = Container(
      child: Text(
        _isLoaded ? widget.article.article : _longEmptyString,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      color: Colors.white,
    );

    var _articleTextIntro = !_isLoaded
        ? Shimmer.fromColors(
            child: _articleTextIntroContainer,
            baseColor: Color(0xFFe2e2e2),
            highlightColor: Colors.white,
          )
        : _articleTextIntroContainer;

    var _bottomRowContainer = (AsyncSnapshot<bool> snapshot) => Container(
          height: _cardBottomStripHeight,
          width: _cardWidth,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                child: Align(
                  child: _isLoaded
                      ? Image.network(
                          widget.article.imageUrl,
                        )
                      : null,
                ),
              ),
              Spacer(),
              Container(
                height: double.infinity,
                child: Align(
                  child: Text(
                    _isLoaded ? widget.article.publishDate : '',
                    style: _greyColorTextStyle,
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: double.infinity,
                child: Align(
                  child: Text(
                    _isLoaded ? widget.article.publisher.name : '',
                    style: _greyColorTextStyle,
                  ),
                ),
              ),

              Spacer(),

              // Bookmark Button
              InkWell(
                child: Icon(
                  (snapshot.hasData && snapshot.data)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  size: 30,
                ),
                onTap: () {
                  if (snapshot.hasData) {
                    if (!snapshot.data) {
                      Provider.of<MyDatabase>(context)
                          .addBookmarked(widget.article);
                    } else {
                      Provider.of<MyDatabase>(context)
                          .removeBookmarked(widget.article);
                    }
                  }
                },
              ),
              Spacer(),
              // Share Widget
              InkWell(
                child: Icon(
                  Icons.share,
                  size: 30,
                ),
                onTap: () {
                  Future.delayed(Duration(milliseconds: 400), () {
                    Share.share(widget.article.articleUrl,
                        subject: 'Share with');
                  });
                },
                splashColor: Colors.blueGrey,
                radius: 50,
              ),
            ],
          ),
        );
    var _bottomRow = (AsyncSnapshot<bool> snapshot) => !_isLoaded
        ? Shimmer.fromColors(
            child: _articleTextIntroContainer,
            baseColor: Color(0xFFe2e2e2),
            highlightColor: Colors.white,
          )
        : _bottomRowContainer(snapshot);

    return Card(
      elevation: 1,
      shadowColor: Colors.grey,
      child: StreamBuilder<bool>(
          stream: Provider.of<MyDatabase>(context).isBookmarked(widget.article),
          builder: (context, snapshot) {
            return InkWell(
              splashColor: Colors.blue.withAlpha(100),
              onTap: () {
                if (widget.article != null &&
                    widget.article.articleUrl != null) {
                  launch(widget.article.articleUrl,
                      forceWebView: true, enableJavaScript: true);
                }
              },
              child: Center(
                widthFactor: 1.1,
                heightFactor: 1.05,
                child: Container(
                  height: _cardHeight,
                  width: _cardWidth,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _cardImage,
                      SizedBox(
                        height: 0.015 * MediaQuery.of(context).size.height,
                      ),
                      _headline,
                      SizedBox(
                        height: 0.015 * MediaQuery.of(context).size.height,
                      ),
                      _articleTextIntro,
                      SizedBox(
                        height: 0.015 * MediaQuery.of(context).size.height,
                      ),
                      _bottomRow(snapshot),
                      SizedBox(
                        height: 0.01 * MediaQuery.of(context).size.height,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
