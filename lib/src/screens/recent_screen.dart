import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/base_article_list_screen.dart';

class RecentScreen extends BaseArticleListScreen{
  RecentScreen({ArticlesType articleType}):super(articleType:articleType);
  @override
  RecentScreenState createState() {
    return RecentScreenState();
  }
}

class RecentScreenState extends BaseArticleListScreenState{}
