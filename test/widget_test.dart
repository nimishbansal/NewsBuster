// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:newsbuster/src/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test('parses article', () {
    const jsonString = """
    {
                "_id": "5ef603b835f5361a78bd358b",
                "headline": "headline1",
                "author": "m the author",
                "publishDate": "26 june2019",
                "imageUrl" : "https://www.youtube.com/watch?v=rfagvy5xCW0&list=PLjxrf2q8roU3ahJVrSgAnPjzkpGmL9Czl&index=5",
                "article": "this is the content of article",
                "claim": null,
                "publisher": {
                    "article": [],
                    "_id": "5ef603b835f5361a78bd358a",
                    "name": "indiatoday",
                    "__v": 0
                },
                "__v": 0
    }
    """;
    expect(parseArticle(jsonString).headline, "headline1");
  });

  test('parses list of article', () {
      const jsonString = """
      [
        {
                "_id": "5ef603b835f5361a78bd358b",
                "headline": "headline1",
                "author": "m the author",
                "publishDate": "26 june2019",
                "imageUrl" : "https://www.youtube.com/watch?v=rfagvy5xCW0&list=PLjxrf2q8roU3ahJVrSgAnPjzkpGmL9Czl&index=5",
                "article": "this is the content of article",
                "claim": null,
                "publisher": {
                    "article": [],
                    "_id": "5ef603b835f5361a78bd358a",
                    "name": "indiatoday",
                    "__v": 0
                },
                "__v": 0
        },
        {
                "_id": "5ef603b835f32323238b",
                "headline": "headline2",
                "author": "m the author2",
                "publishDate": "26 june 2019",
                "imageUrl" : "https://www.youtube.com/watch?v=rfagvy5xCW0&list=PLjxrf2q8roU3ahJVrSgAnPjzkpGmL9Czl&index=5",
                "article": "this is the content of article2",
                "claim": {"result":"false"},
                "publisher": {
                    "article": [],
                    "_id": "5ef603b835f5361a7834323",
                    "name": "news mobile",
                    "__v": 0
                },
                "__v": 0
        }
       
      ]
        
    """;
      expect(parseArticles(jsonString)[0].headline, "headline1");
  });

  test('parses list of article from web', () async {
    final url = "http://7020129d0809.ngrok.io/api/v1/get-recent-posts/";
    final res = await http.get(url);
    if(res.statusCode == 200){
      String jsonStr = json.encode(json.decode(res.body)["date"]["articles"]);
      expect(parseArticles(jsonStr)[0].headline, "hea11111dline hu mai");
    }
  });
}
