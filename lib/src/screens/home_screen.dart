import 'package:flutter/material.dart';
import 'package:newsbuster/src/widgets/article_card.dart';
import 'package:shimmer/shimmer.dart';


class HomeScreen extends StatefulWidget {
  final screenName = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView.builder(itemBuilder: _itemBuilder),
      ),
    );

  }

  Widget _itemBuilder(BuildContext context, int index) {
    List<String> urls = [
      "https://i.guim.co.uk/img/media/eae8149b8d4bdba5977b66de762b7d16eb76abed/0_215_4113_2469/master/4113.jpg?width=620&quality=85&auto=format&fit=max&s=d29c04ac43c334a2d65649a1a73f6f5f",
      "https://i.guim.co.uk/img/media/2ef714b320bfe94f322d50b1eea3164a017f4001/0_117_3500_2101/master/3500.jpg?width=620&quality=85&auto=format&fit=max&s=ca3dc407e8b665a87b6bda3b6a7df9a6",
      "https://images.livemint.com/img/2020/06/25/90x90/2020-04-28T113547Z_1_LYNXNPEG3R13Q_RTROPTP_3_AXISBANK-RESULTS_1592242033138_1593087986700.JPG",
    ];
    return ArticleCard(imageUrl: urls[index % (urls.length)]);
  }
}
