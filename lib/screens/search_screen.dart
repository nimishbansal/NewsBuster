import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {

  final screenName = 'Search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(widget.screenName),
    );
  }
}
