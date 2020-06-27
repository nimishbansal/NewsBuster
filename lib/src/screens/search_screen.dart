import 'package:flutter/material.dart';

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
    LinearGradient gradient1 = LinearGradient(
      colors: [],
      stops: [0.7, 0.3],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient1,
        ),
      ),
    );
  }
}
