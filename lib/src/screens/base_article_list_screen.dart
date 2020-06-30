import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/home_screen.dart';
import 'package:newsbuster/src/screens/trending_screen.dart';
import 'package:newsbuster/src/screens/recent_screen.dart';
import 'package:newsbuster/src/widgets/article_card.dart';
import 'package:newsbuster/src/widgets/article_card_2.dart';
import 'package:provider/provider.dart';

/// This threshold is responsible for loading next page before
/// reaching instantaneous end of list view.
const double _scrollThreshold = 1400;

/// It is a base screen for other screens that will show the list of articles
/// Screens currently that are using it are [HomeScreen], [TrendingScreen]
/// and [RecentScreen].
abstract class BaseArticleListScreen extends StatefulWidget {
  BaseArticleListScreen({Key key, @required this.articleType})
      : assert(articleType != null),
        super(key: key);

  final ArticlesType articleType;
}

/// It is a base state of screens that inherits the [BaseArticleListScreen].
abstract class BaseArticleListScreenState<T extends BaseArticleListScreen>
    extends State<T> {
  ScrollController _scrollController;
  Function _scrollControllerListener;

  int pagesLoaded = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    final articleModel = Provider.of<ArticleListModel>(context, listen: false);

    //add articles on scrolling
    _scrollControllerListener = () {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - _scrollThreshold) {
        if (!articleModel.isLoading) articleModel.addMoreArticles();
      }
    };
    _scrollController.addListener(_scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final articleModel = Provider.of<ArticleListModel>(context, listen: false);
    if (articleModel.currentArticleType != widget.articleType) {
      // tab has been changed, so show empty page first.
      articleModel.emptyArticles();
      if (articleModel.isNullForShimmer) {
        Future(() => articleModel.loadInitialArticles(widget.articleType));
      }
    }

    return Center(
      child: Container(
        child: Consumer<ArticleListModel>(builder: (_, articleListModel, __) {
          return ListView.builder(
            itemBuilder: _itemBuilder,
            controller: _scrollController,
            itemCount: articleModel.articles.length + 2,
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final articleListModel =
        Provider.of<ArticleListModel>(context, listen: false);
    final articles = articleListModel.articles;

    // TODO(nimish): choose either progress indicator or shimmer for
    // loading articles.
    if (false && index >= articles.length && articleListModel.isLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (index < articles.length) {
      return ArticleCard2(article: articles[index]);
    } else {
      return ArticleCard2(
        article: null,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollControllerListener);
    super.dispose();
  }
}
