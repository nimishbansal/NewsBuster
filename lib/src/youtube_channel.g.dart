// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_channel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<YoutubeVideo> _$youtubeVideoSerializer =
    new _$YoutubeVideoSerializer();
Serializer<YoutubeChannelVideosCarousel>
    _$youtubeChannelVideosCarouselSerializer =
    new _$YoutubeChannelVideosCarouselSerializer();

class _$YoutubeVideoSerializer implements StructuredSerializer<YoutubeVideo> {
  @override
  final Iterable<Type> types = const [YoutubeVideo, _$YoutubeVideo];
  @override
  final String wireName = 'YoutubeVideo';

  @override
  Iterable<Object> serialize(Serializers serializers, YoutubeVideo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'videoLink',
      serializers.serialize(object.videoLink,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  YoutubeVideo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeVideoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'videoLink':
          result.videoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeChannelVideosCarouselSerializer
    implements StructuredSerializer<YoutubeChannelVideosCarousel> {
  @override
  final Iterable<Type> types = const [
    YoutubeChannelVideosCarousel,
    _$YoutubeChannelVideosCarousel
  ];
  @override
  final String wireName = 'YoutubeChannelVideosCarousel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, YoutubeChannelVideosCarousel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'channel_name',
      serializers.serialize(object.channelName,
          specifiedType: const FullType(String)),
      'channel_image_url',
      serializers.serialize(object.channelImageUrl,
          specifiedType: const FullType(String)),
      'channel_url',
      serializers.serialize(object.channelUrl,
          specifiedType: const FullType(String)),
      'videos',
      serializers.serialize(object.videos,
          specifiedType:
              const FullType(BuiltList, const [const FullType(YoutubeVideo)])),
    ];

    return result;
  }

  @override
  YoutubeChannelVideosCarousel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeChannelVideosCarouselBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'channel_name':
          result.channelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'channel_image_url':
          result.channelImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'channel_url':
          result.channelUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(YoutubeVideo)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeVideo extends YoutubeVideo {
  @override
  final String imageUrl;
  @override
  final String videoLink;

  factory _$YoutubeVideo([void Function(YoutubeVideoBuilder) updates]) =>
      (new YoutubeVideoBuilder()..update(updates)).build();

  _$YoutubeVideo._({this.imageUrl, this.videoLink}) : super._() {
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('YoutubeVideo', 'imageUrl');
    }
    if (videoLink == null) {
      throw new BuiltValueNullFieldError('YoutubeVideo', 'videoLink');
    }
  }

  @override
  YoutubeVideo rebuild(void Function(YoutubeVideoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeVideoBuilder toBuilder() => new YoutubeVideoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeVideo &&
        imageUrl == other.imageUrl &&
        videoLink == other.videoLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, imageUrl.hashCode), videoLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeVideo')
          ..add('imageUrl', imageUrl)
          ..add('videoLink', videoLink))
        .toString();
  }
}

class YoutubeVideoBuilder
    implements Builder<YoutubeVideo, YoutubeVideoBuilder> {
  _$YoutubeVideo _$v;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _videoLink;
  String get videoLink => _$this._videoLink;
  set videoLink(String videoLink) => _$this._videoLink = videoLink;

  YoutubeVideoBuilder();

  YoutubeVideoBuilder get _$this {
    if (_$v != null) {
      _imageUrl = _$v.imageUrl;
      _videoLink = _$v.videoLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeVideo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeVideo;
  }

  @override
  void update(void Function(YoutubeVideoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeVideo build() {
    final _$result =
        _$v ?? new _$YoutubeVideo._(imageUrl: imageUrl, videoLink: videoLink);
    replace(_$result);
    return _$result;
  }
}

class _$YoutubeChannelVideosCarousel extends YoutubeChannelVideosCarousel {
  @override
  final String channelName;
  @override
  final String channelImageUrl;
  @override
  final String channelUrl;
  @override
  final BuiltList<YoutubeVideo> videos;

  factory _$YoutubeChannelVideosCarousel(
          [void Function(YoutubeChannelVideosCarouselBuilder) updates]) =>
      (new YoutubeChannelVideosCarouselBuilder()..update(updates)).build();

  _$YoutubeChannelVideosCarousel._(
      {this.channelName, this.channelImageUrl, this.channelUrl, this.videos})
      : super._() {
    if (channelName == null) {
      throw new BuiltValueNullFieldError(
          'YoutubeChannelVideosCarousel', 'channelName');
    }
    if (channelImageUrl == null) {
      throw new BuiltValueNullFieldError(
          'YoutubeChannelVideosCarousel', 'channelImageUrl');
    }
    if (channelUrl == null) {
      throw new BuiltValueNullFieldError(
          'YoutubeChannelVideosCarousel', 'channelUrl');
    }
    if (videos == null) {
      throw new BuiltValueNullFieldError(
          'YoutubeChannelVideosCarousel', 'videos');
    }
  }

  @override
  YoutubeChannelVideosCarousel rebuild(
          void Function(YoutubeChannelVideosCarouselBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeChannelVideosCarouselBuilder toBuilder() =>
      new YoutubeChannelVideosCarouselBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeChannelVideosCarousel &&
        channelName == other.channelName &&
        channelImageUrl == other.channelImageUrl &&
        channelUrl == other.channelUrl &&
        videos == other.videos;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, channelName.hashCode), channelImageUrl.hashCode),
            channelUrl.hashCode),
        videos.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeChannelVideosCarousel')
          ..add('channelName', channelName)
          ..add('channelImageUrl', channelImageUrl)
          ..add('channelUrl', channelUrl)
          ..add('videos', videos))
        .toString();
  }
}

class YoutubeChannelVideosCarouselBuilder
    implements
        Builder<YoutubeChannelVideosCarousel,
            YoutubeChannelVideosCarouselBuilder> {
  _$YoutubeChannelVideosCarousel _$v;

  String _channelName;
  String get channelName => _$this._channelName;
  set channelName(String channelName) => _$this._channelName = channelName;

  String _channelImageUrl;
  String get channelImageUrl => _$this._channelImageUrl;
  set channelImageUrl(String channelImageUrl) =>
      _$this._channelImageUrl = channelImageUrl;

  String _channelUrl;
  String get channelUrl => _$this._channelUrl;
  set channelUrl(String channelUrl) => _$this._channelUrl = channelUrl;

  ListBuilder<YoutubeVideo> _videos;
  ListBuilder<YoutubeVideo> get videos =>
      _$this._videos ??= new ListBuilder<YoutubeVideo>();
  set videos(ListBuilder<YoutubeVideo> videos) => _$this._videos = videos;

  YoutubeChannelVideosCarouselBuilder();

  YoutubeChannelVideosCarouselBuilder get _$this {
    if (_$v != null) {
      _channelName = _$v.channelName;
      _channelImageUrl = _$v.channelImageUrl;
      _channelUrl = _$v.channelUrl;
      _videos = _$v.videos?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeChannelVideosCarousel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeChannelVideosCarousel;
  }

  @override
  void update(void Function(YoutubeChannelVideosCarouselBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeChannelVideosCarousel build() {
    _$YoutubeChannelVideosCarousel _$result;
    try {
      _$result = _$v ??
          new _$YoutubeChannelVideosCarousel._(
              channelName: channelName,
              channelImageUrl: channelImageUrl,
              channelUrl: channelUrl,
              videos: videos.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videos';
        videos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'YoutubeChannelVideosCarousel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
