import 'dart:io';
import 'dart:convert' as json;
import 'package:moor/moor.dart';
import 'package:newsbuster/src/article.dart';
import 'package:newsbuster/src/serializers.dart';
import 'package:path/path.dart' as p;
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math' as math;

part 'bookmark_db.g.dart';

class BookmarkedArticle extends Table {
  TextColumn get id => text().customConstraint('UNIQUE')();
  TextColumn get json_detail => text()();

  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(file);
  });
}

@UseMoor(tables: [BookmarkedArticle])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<BookmarkedArticleData>> get allBookmarkedArticles =>
      select(bookmarkedArticle).get();

  void addBookmarked(Article article) {
    // not saving the full article, instead saving only first few characters to show on card
    var newArticle = article.rebuild((b) =>
        b..article = b.article.substring(0, math.min(140, b.article.length)));

    var jsonDetail = json.jsonEncode(
        standardSerializers.serializeWith(Article.serializer, newArticle));

    var bookmarked =
        BookmarkedArticleData(id: newArticle.id, json_detail: jsonDetail);

    into(bookmarkedArticle).insert(bookmarked);

  }

  void removeBookmarked(Article article) {
    (delete(bookmarkedArticle)..where((t) => t.id.equals(article.id))).go();
  }

  Stream<bool> isBookmarked(Article article) {
    return select(bookmarkedArticle).watch().map((bookmarkedList) =>
        bookmarkedList.any((bookmarked) => bookmarked.id == article.id));
  }

  Stream<List<Article>> get bookmarkedArticleListStream{
    return select(bookmarkedArticle).watch().map((bookmarkedList) => _getArticlesFromBookmarkedArticleList(bookmarkedList));
  }

  List<Article> _getArticlesFromBookmarkedArticleList(List<BookmarkedArticleData> bookmarkedList) {
    List<Article> articles = [];
    for(var bookmarked in bookmarkedList){
      articles.add(parseArticle(bookmarked.json_detail));
    }
    return articles;
  }

}
