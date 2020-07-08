import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/utils/search_utils.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  final screenName = 'Search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ArticleSearch articleSearch;

  @override
  void initState() {
    super.initState();
    articleSearch = ArticleSearch();
  }

  @override
  Widget build(BuildContext context) {
    Future(() => showSearch(context: context, delegate: ArticleSearch()));
    return Center(
      child: Container(
        color: Colors.white30,
      ),
    );
    /*
    return ListView(
      children: [

        Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
    */
  }
}

class ArticleSearch extends SearchDelegate<Article> {

  String currentQuery = "";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query!=currentQuery || query==""){
      final articleModel = Provider.of<ArticleListModel>(context, listen: false);
      articleModel.searchArticles(query: query);

    }
    return Consumer<ArticleListModel>(
        builder: (BuildContext context, articleListModel, __) {
          currentQuery = query;
          return ListView(
        children: articleListModel.articles
            .map((Article article) => _buildSuggestionTile(article, context))
            .toList(),
      );
    });
  }

  Widget _buildSuggestionTile(Article article, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(20, 50))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(article.imageUrl),
          title: RichText(
            text: TextSpan(
              children: highlightOccurrences(article.headline, currentQuery),
              style: TextStyle(color: Colors.grey),
            ),
          ),
          onTap: (){
            launch(article.articleUrl,
                    forceWebView: true, enableJavaScript: true);
          },
        ),
      ),
    );
  }
}
