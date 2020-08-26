import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsbuster/src/youtube_channel.dart';

class HomeGalleryModel extends ChangeNotifier {

  static const _baseUrl = "http://3.14.8.229:8001/api/v1";
  static const _homeGalleryCarouselSlidersEndpoint  = '/homeGalleryChannels';
  bool _isLoading = true;
  bool get isLoading{
    return _isLoading;
  }

  List<YoutubeChannelVideosCarousel> channelVideosCarousel = [];
  void fetchGalleryData() async {
    final res = await http.get("$_baseUrl$_homeGalleryCarouselSlidersEndpoint");
    _isLoading = false;
    if (res.statusCode == 200) {
      String jsonStr = json.encode(json.decode(res.body));
      channelVideosCarousel = parseYoutubeChannelsAndTheirVideoCarousels(jsonStr);
      notifyListeners();
      return;
    }
    throw Exception("Error occurred while fetching home gallery carousel with response ${res.body}");
  }
}
