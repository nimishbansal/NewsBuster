import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

/// [YoutubeVideo] handles the youtube video details of a Youtube Video
class YoutubeVideo {
  String imageUrl;
  String videoLink;
  YoutubeVideo({@required this.imageUrl, @required this.videoLink});
}


/// Designs a Box for carousel Item
Function makeContentBox = (YoutubeVideo video)=>Padding(
  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
  child:   Material(
    child: Ink(
      child: InkWell(
        onTap: (){
          launch(video.videoLink);
        },
        splashColor: const Color(0xFF34b0fc),
        child: Container(
          child: Image.network(
            video.imageUrl, fit: BoxFit.fitWidth,),
          width: 200,
          height: 120,
        color: Colors.transparent,
        ),
      ),
    ),
  ),
);




/// [ChannelVideosCarousel] is for displaying scrolling list of videos for a
/// particular media house.
class ChannelVideosCarousel extends StatefulWidget {

  const ChannelVideosCarousel({Key key, this.videos, this.channelName, this.channelIconUrl}) : super(key: key);

  /// Name of the channel
  final String channelName;

  // Url of channel logo image.
  final String channelIconUrl;

  /// Videos to display in channel's carousel
  final List<YoutubeVideo> videos;

  @override
  _ChannelVideosCarouselState createState() => _ChannelVideosCarouselState();


}


class _ChannelVideosCarouselState extends State<ChannelVideosCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                ' ' + widget.channelName,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 10,),
              Image.network(
                widget.channelIconUrl,
                width: 35,
                height: 35,
              ),
            ]),
        SizedBox(height: 10,),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              for(var video in widget.videos)
                makeContentBox(video)
            ],
          ),
        )
      ],
    );
  }
}


class OverviewHomeScreen extends StatefulWidget {
  @override
  _OverviewHomeScreenState createState() => _OverviewHomeScreenState();
}


class _OverviewHomeScreenState extends State<OverviewHomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  // On the basis of selected tab it shows Articles or Gallery.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(text:"Gallery", ),//, style: TextStyle(color: Colors.black),),),
                      Tab(text:"Articles"),//, style: TextStyle(color: Colors.black),),),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width, 
                    child: TabBarView(
                      children: <Widget>[
                        Icon(Icons.directions_car),
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

        /*
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 0.87*MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    Quint,
                    SizedBox(height: 20,),
                    TheWire,
                    SizedBox(height: 20,),
                    AkashBanerjee,
                    SizedBox(height: 20,),
                    Quint,
                  ],
                ),
              ),
            ],
          ),
        ),
        */
  }
}

var Quint = ChannelVideosCarousel(
  channelIconUrl: "https://images.thequint.com/thequint%2F2015-03%2F42204dde-0e2b-4f65-8852-772e65af707c%2F10401878_388526704647857_6972995066150491380_n.jpg?auto=format%2Ccompress&w=1000",
  channelName: 'The Quint',
  videos: [
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/Y5TVKvViWNA/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLD7ET7ddcAi2taGb9QQjxj3dsTfRg', videoLink: 'https://www.youtube.com/watch?v=Y5TVKvViWNA'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/CopZ57uSACg/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLA4thtqXLMyFBqefiPjowRjxnAMRw', videoLink: 'https://www.youtube.com/watch?v=CopZ57uSACg'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/iQN0TjeJ8TI/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBpurMYRT-AZ7n8p2oxJ1UgqjZSyw', videoLink: 'https://www.youtube.com/watch?v=iQN0TjeJ8TI'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/x-ThsvWuK40/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCJhmoDPl5DdEH7hXtx39qh4GcfEA', videoLink: 'https://www.youtube.com/watch?v=x-ThsvWuK40'),
  ],
);


var TheWire = ChannelVideosCarousel(
  channelIconUrl: "https://yt3.ggpht.com/a/AATXAJwWWNwMHkYA15xaS5xsq68QKYMQgp8invVK6_WQ-Q=s176-c-k-c0x00ffffff-no-rj-mo",
  channelName: 'The Wire',
  videos: [
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/yLwNvqzWy7Q/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB1A8B-bDO-stzcbVreqW83EB3BuA', videoLink: 'https://www.youtube.com/watch?v=yLwNvqzWy7Q'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/6Wydnt_AF38/mqdefault_6s.webp?du=3000&sqp=CPS4g_oF&rs=AOn4CLDna9Ci6IDC4G2bdb0obnNfKBO7NA', videoLink: 'https://www.youtube.com/watch?v=I_G6SS1HvV0'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/vi/yLwNvqzWy7Q/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLB1A8B-bDO-stzcbVreqW83EB3BuA', videoLink: 'https://www.youtube.com/watch?v=iQN0TjeJ8TI'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/JVrhW-Q_dKo/mqdefault_6s.webp?du=3000&sqp=COjfg_oF&rs=AOn4CLBZTCUXciAmX1QkQ8moKH_kmjyd6w', videoLink: 'https://www.youtube.com/watch?v=x-ThsvWuK40'),
  ],
);

var AkashBanerjee = ChannelVideosCarousel(
  channelIconUrl: "https://yt3.ggpht.com/a/AATXAJwQoXFT4L-_Y9hSFcyXO8aDMMx8H4bcwW4EmHW3wOg=s176-c-k-c0x00ffffff-no-rj-mo",
  channelName: 'Akash Banerjee',
  videos: [
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/eZnZfqjrIus/mqdefault_6s.webp?du=3000&sqp=CMPbg_oF&rs=AOn4CLCF61njuSLQn98jk5SpwSYVUs_DZw', videoLink: 'https://www.youtube.com/watch?v=kMR0rm46YrI'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/eZnZfqjrIus/mqdefault_6s.webp?du=3000&sqp=CMb4gPoF&rs=AOn4CLAjBB_K3GTI36hnDQKiwU-o5gEfSQ', videoLink: 'https://www.youtube.com/watch?v=eZnZfqjrIus&t=19s'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/kMR0rm46YrI/mqdefault_6s.webp?du=3000&sqp=CKbogPoF&rs=AOn4CLATuKwx1zJOsTKXVaEsb1t-g5C-WA', videoLink: 'https://www.youtube.com/watch?v=kMR0rm46YrI'),
    YoutubeVideo(imageUrl: 'https://i.ytimg.com/an_webp/eZnZfqjrIus/mqdefault_6s.webp?du=3000&sqp=CMb4gPoF&rs=AOn4CLAjBB_K3GTI36hnDQKiwU-o5gEfSQ', videoLink: 'https://www.youtube.com/watch?v=eZnZfqjrIus&t=19s'),
  ],
);



