import 'package:flutter/material.dart';

class RecentScreen extends StatefulWidget {

  final screenName = 'Recent';

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(widget.screenName),
    );
  }
}
