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
    Future(()=>showSearch(context: context, delegate: ArticleSearch()));
    return Center(child: Container(color: Colors.white30,),);
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
