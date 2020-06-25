import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {

  final screenName = 'Trending';

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(widget.screenName),
    );
  }
}
