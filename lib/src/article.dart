import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:newsbuster/src/fact_check_result.dart';
import 'package:newsbuster/src/serializers.dart';

import 'publisher.dart';

part 'article.g.dart';
abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;
  String get id;
  String get headline;
  String get author;
  String get publishDate;
  @nullable
  String get article;
  @nullable
  String get imageUrl;
  @nullable
  String get articleUrl;
  Publisher get publisher;
  FactCheckResult get claim;
  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

Article parseArticle(String jsonStr) {
  var parsed = json.jsonDecode(jsonStr);
  var article = standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}

List<Article> parseArticles(String jsonStr) {
    var parsed = json.jsonDecode(jsonStr) as List<dynamic>;
    List<Article> articles = [];
    parsed.forEach((element) {
      articles.add(standardSerializers.deserializeWith(Article.serializer, element));
    });
    return articles;
}
