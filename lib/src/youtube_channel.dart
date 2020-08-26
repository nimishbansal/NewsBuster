import 'dart:convert' as json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:newsbuster/src/serializers.dart';

part 'youtube_channel.g.dart';

/// [YoutubeVideo] handles the youtube video details of a Youtube Video
abstract class YoutubeVideo implements Built<YoutubeVideo, YoutubeVideoBuilder> {
  static Serializer<YoutubeVideo> get serializer => _$youtubeVideoSerializer;
  /// Thumbnail image url of the video
  String get imageUrl;

  /// Href of the video
  String get videoLink;

  YoutubeVideo._();
  factory YoutubeVideo([void Function(YoutubeVideoBuilder) updates]) = _$YoutubeVideo;
}




/// [YoutubeChannelVideosCarousel[ is responsible to show show carousels
/// for different youtube channels
abstract class YoutubeChannelVideosCarousel implements Built<YoutubeChannelVideosCarousel, YoutubeChannelVideosCarouselBuilder> {
  static Serializer<YoutubeChannelVideosCarousel> get serializer => _$youtubeChannelVideosCarouselSerializer;

  /// Name of the channel
  @BuiltValueField(wireName: 'channel_name')
  String get channelName;

  /// Url of channel logo image.
  @BuiltValueField(wireName: 'channel_image_url')
  String get channelImageUrl;

  /// Url of channel logo image.
  @BuiltValueField(wireName: 'channel_url')
  String get channelUrl;

  /// Videos to display in channel's carousel on home Gallery Screen
  @BuiltValueField(wireName: 'videos')
  BuiltList<YoutubeVideo> get videos;

  YoutubeChannelVideosCarousel._();
  factory YoutubeChannelVideosCarousel([void Function(YoutubeChannelVideosCarouselBuilder) updates]) = _$YoutubeChannelVideosCarousel;
}


List<YoutubeChannelVideosCarousel> parseYoutubeChannelsAndTheirVideoCarousels(String jsonStr) {
  var parsed = json.jsonDecode(jsonStr) as List<dynamic>;

  List<YoutubeChannelVideosCarousel> youtubeChannelsVideoCarousel = [];
  parsed.forEach((element) {
      youtubeChannelsVideoCarousel.add(
          standardSerializers.deserializeWith(
              YoutubeChannelVideosCarousel.serializer, element));
  });
  return youtubeChannelsVideoCarousel;
}
