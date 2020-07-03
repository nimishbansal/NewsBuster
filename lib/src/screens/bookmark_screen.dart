import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/bookmark_db.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/base_article_list_screen.dart';
import 'package:newsbuster/src/widgets/article_card_2.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends BaseArticleListScreen {
  BookmarkScreen({ArticlesType articleType}) : super(articleType: articleType);

  @override
  BookmarkScreenState createState() {
    return BookmarkScreenState();
  }
}

class BookmarkScreenState extends BaseArticleListScreenState {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Article>>(
        stream: Provider.of<MyDatabase>(context).bookmarkedArticleListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('No Articles Bookmarked'),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleCard2(
                  article: snapshot.data[index],
                );
              },
              itemCount: snapshot.data.length,
            );
          }
          return SizedBox();
        });
  }
}
