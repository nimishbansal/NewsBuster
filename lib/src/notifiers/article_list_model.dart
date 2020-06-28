import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// It is responsible for notifying consumers whenever the article list
/// changes. It handles articles present on HomeScreen, TrendingScreen,
/// RecentScreen
class ArticleListModel extends ChangeNotifier {
  List<Article> _articles = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];

  int pageLoaded = 0;

  bool get isNullForShimmer{
    return _articles.first == null;
  }

  List<Article> get articles {
    return _articles;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

//    static const _baseUrl = "http://7020129d0809.ngrok.io/api/v1/";
  static const _baseUrl = "http://nimishbansal.pythonanywhere.com/";
  static const _recentPostsEndPoint = "/get-recent-posts";

  Future<List<Article>> _fetchArticles({int page: 1}) async {
    _isLoading = true;
    notifyListeners();
    final res = await http.get("$_baseUrl$_recentPostsEndPoint?page=$page");
    _isLoading = false;
    notifyListeners();
    print(res.statusCode);
    if (res.statusCode == 200) {
      String jsonStr = json.encode(json.decode(res.body)["data"]["articles"]);
      return parseArticles(jsonStr);
    }
    throw Exception("Error occurred while fetching articles at page $page");
  }

  void addArticles() async {
    Future<List<Article>> articles = _fetchArticles(page: ++pageLoaded);
    if (isNullForShimmer){
      this._articles = [...await articles];
    }
    else{
      this._articles = [...this._articles, ...await articles];
    }
    notifyListeners();

  }
}
