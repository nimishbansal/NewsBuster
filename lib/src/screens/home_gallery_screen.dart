import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/notifiers/home_gallery_model.dart';
import 'package:newsbuster/src/screens/home_screen.dart';
import 'package:newsbuster/src/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../youtube_channel.dart';

/// Designs a thumbnail box for youtube video element in carousel
/// for each channel
class YoutubeVideoElementWidget extends StatelessWidget {
  final YoutubeVideo video;

  const YoutubeVideoElementWidget({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Material(
        child: Ink(
          child: InkWell(
            onTap: () {
              launch(video.videoLink);
            },
            splashColor: const Color(0xFF34b0fc),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              child: Image.network(
                video.imageUrl,
                fit: BoxFit.fitWidth,
              ),
              width: 200,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselGalleryScreen extends StatefulWidget {
  @override
  _CarouselGalleryScreenState createState() => _CarouselGalleryScreenState();
}

class _CarouselGalleryScreenState extends State<CarouselGalleryScreen> {
  @override
  void initState() {
    super.initState();
    final homeGalleryModel =
        Provider.of<HomeGalleryModel>(context, listen: false);
    homeGalleryModel.fetchGalleryData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeGalleryModel>(builder: (_, homeGalleryModel, __) {
      if (homeGalleryModel.isLoading) return SpinKitDoubleBounce(color: Colors.lightBlueAccent,);
      return ListView(
        children: <Widget>[
          for (var item in homeGalleryModel.channelVideosCarousel)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ' ' + item.channelName,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.network(
                      item.channelImageUrl,
                      width: 35,
                      height: 35,
                    ),
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        launch(item.channelUrl);
                      },
                      child: Text('More',),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var video in item.videos)
                        YoutubeVideoElementWidget(video: video)
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            )
        ],
      );
    });
  }
}

class OverviewHomeScreen extends StatefulWidget {
  @override
  _OverviewHomeScreenState createState() => _OverviewHomeScreenState();
}

class _OverviewHomeScreenState extends State<OverviewHomeScreen>
    with SingleTickerProviderStateMixin {
  // On the basis of selected tab it shows Articles or Gallery.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(text: "Gallery"),
                      Tab(text: "Articles"),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      children: <Widget>[
                        CarouselGalleryScreen(),
                        HomeScreen(articleType: ArticlesType.Home),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
