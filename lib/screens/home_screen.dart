import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final screenName = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(widget.screenName),
    );
  }
}
