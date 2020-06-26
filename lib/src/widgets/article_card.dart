import 'package:flutter/material.dart';

/// Card for displaying a news article.
class ArticleCard extends StatefulWidget {
    final imageUrl;

    const ArticleCard({Key key, this.imageUrl}) : super(key: key);

    @override
    _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {

    @override
    Widget build(BuildContext context) {
        return Card(
            elevation: 2,
            shadowColor: Colors.orangeAccent,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                    print('Card tapped.');
                },
                child: Container(
                    height: 0.30 * MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.network(
                                    widget.imageUrl,
                                    height: 0.34 * MediaQuery.of(context).size.width,
                                    width: 0.34 * MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                ),
                            ),
                            SizedBox(
                                    height: 0.34 * MediaQuery.of(context).size.width,
                                    width: 0.05 * MediaQuery.of(context).size.width),
                            Container(
                                width: 0.55 * MediaQuery.of(context).size.width,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                        Text(
                                                'Coronavirus live news: more than 9.5m cases worldwide'),
                                        Text(
                                            'India Today, 25 Jun 2020',
                                            style: TextStyle(color: Colors.grey),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
