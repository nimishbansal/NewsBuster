import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {

  final screenName = 'Bookmark';

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(widget.screenName),
    );
  }
}
