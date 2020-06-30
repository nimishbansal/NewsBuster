import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ArticlesType { Recent, Trending, Home }

List<Article> defaultArticlesNullList = [null, null, null, null, null, null];

/// It is responsible for notifying consumers whenever the article list
/// changes. It handles articles present on HomeScreen, TrendingScreen,
/// RecentScreen
class ArticleListModel extends ChangeNotifier {
  List<Article> _articles = defaultArticlesNullList;

  int pageLoaded = 0;

  bool get isNullForShimmer {
    return _articles.first == null;
  }

  List<Article> get articles {
    return _articles;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ArticlesType _currentArticleType;
  ArticlesType get currentArticleType{
    return _currentArticleType;
  }

//    static const _baseUrl = "http://7020129d0809.ngrok.io/api/v1/";
  static const _baseUrl = "http://nimishbansal.pythonanywhere.com/";
  static const _recentPostsEndPoint = "/get-recent-posts";
  static const _trendingPostsEndPoint = "/get-trending-posts";
  static const _homePostsEndPoint = "/get-home-posts";

  Future<List<Article>> _fetchArticles({int page: 1}) async {
    String endPoint = _getEndPointForTopic(_currentArticleType);
    final res = await http.get("$_baseUrl$endPoint?page=$page");
    if (res.statusCode == 200) {
      String jsonStr = json.encode(json.decode(res.body)["data"]["articles"]);
      return parseArticles(jsonStr);
    }
    throw Exception("Error occurred while fetching articles at page $page");
  }


  void loadInitialArticles(ArticlesType articleType) async {
    _currentArticleType = articleType;
    _isLoading = true;
    notifyListeners();
    this._articles = await _fetchArticles(page: 1);
    _isLoading = false;
    notifyListeners();
    pageLoaded++;
  }

  void addMoreArticles() async {
    _isLoading = true;
    notifyListeners();
    this._articles = [...this._articles, ...await _fetchArticles(page: ++pageLoaded)];
    _isLoading = false;
    notifyListeners();
  }

  void emptyArticles() {
    this._articles = defaultArticlesNullList;
    pageLoaded = 0;
  }

  String _getEndPointForTopic(ArticlesType articlesType) {
    switch (articlesType) {
      case ArticlesType.Home:
        return _homePostsEndPoint;
      case ArticlesType.Recent:
        return _recentPostsEndPoint;
      case ArticlesType.Trending:
        return _trendingPostsEndPoint;
      default:
        return null;
    }
  }
}
