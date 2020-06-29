import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/widgets/article_card.dart';
import 'package:provider/provider.dart';

const double _kScrollThreshold = 0.6;

class HomeScreen extends StatefulWidget {
  final screenName = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  int pagesLoaded = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels >= _kScrollThreshold * _scrollController.position.maxScrollExtent){
////            _loadMoreArticles();
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    final articleModel = Provider.of<ArticleListModel>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _kScrollThreshold * _scrollController.position.maxScrollExtent) {
        if (!articleModel.isLoading) articleModel.addArticles();
      }
    });

    if (articleModel.isNullForShimmer) {
      Future<void>(() => articleModel.addArticles());
    }

    return Center(
      child: Container(
        child: Consumer<ArticleListModel>(builder: (_, articleListModel, __) {
          return ListView.builder(
            itemBuilder: _itemBuilder,
            controller: _scrollController,
            itemCount: articleModel.articles.length + 10,
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
      return ArticleCard(article: articles[index]);
    } else {
      return ArticleCard(
        article: null,
      );
    }
  }
}
