import 'package:flutter/material.dart';
import 'package:newsbuster/src/article.dart';

class SearchScreen extends StatefulWidget {
  final screenName = 'Search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 0.35 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      1, 1), // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xCC0060FF),
                    Color(0xFF0060FF),
                    const Color(0xFFAABBFF)
                  ],
                  stops: [0, 0.33, 0.66],
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
          ),
        ),
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
  }
}

class ArticleSearch extends SearchDelegate<Article> {
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
    return Container();
  }
}
