
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Order of widgets
///
/// 1. Thumbnail
/// 2. Slider
/// 3. Heading
/// 4. Publisher
/// 5. Playback Controllers
/// 6. Volume Controller
class PodCastScreen extends StatefulWidget {
  final String url =
      "http://feeds.soundcloud.com/stream/667905218-glen-george-607559705-rate-cut-in-slowing-economy.mp3";
  @override
  _PodCastScreenState createState() => _PodCastScreenState();
}

class _PodCastScreenState extends State<PodCastScreen> {
  bool _isPlaying = true;

  double _currentPosition = 0;

  double _currentVolume = 1;

  AudioPlayer _audioPlayer;

  double _totalDuration = 3600;

  /// 1 if loaded, 0 if not.
  int result = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    play();
    _audioPlayer.onAudioPositionChanged.listen(_handleAudioPositionStateChange);
  }

  @override
  Widget build(BuildContext context) {
    if (result == 0)
      return Scaffold(
        body: Shimmer.fromColors(
          child: Container(
            color: Colors.white,
          ),
          baseColor: Color(0xFFe2e2e2),
          highlightColor: Colors.white,
        ),
      );
    var url =
        "https://img.etimg.com/thumb/width-264,height-198,imgsize-113078,msid-76815877,resizemode-4/market-watch-how-long-can-this-market-keep-rising.jpg";
    var headingText = "How long can this market keep rising?";
    var publisherName = "Economic Times";
    var thumbnail = Card(
      child: Container(
        child: Image.network(url),
      ),
    );
    var _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 3,
      thumbColor: Colors.cyanAccent,
      activeTrackColor: Colors.cyan,
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorColor: Colors.red,
    );
    var slider = SliderTheme(
      child: Slider(
        onChanged: _onSliderPositionChanged,
        value: _currentPosition,
        max: _totalDuration,
        label: _currentPosition.toString(),
      ),
      data: _sliderThemeData,
    );

    var publisher = Text(
      publisherName,
      style: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
    );
    var heading = Text(headingText,
        style: TextStyle(color: Colors.white54, fontSize: 20));

    var rewind30Seconds = InkWell(
      child: Icon(
        Icons.replay_30,
        size: 40,
        color: Colors.white,
      ),
      onTap: () => _seek(seconds: (_currentPosition - 30).toInt()),
    );

    var forward30Seconds = InkWell(
      child: Icon(
        Icons.forward_30,
        size: 40,
        color: Colors.white,
      ),
      onTap: () => _seek(seconds: (_currentPosition + 30).toInt()),
    );
    var playPauseButton = InkWell(
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          size: 65,
          color: Colors.white,
        ),
        onTap: _onTogglePlayPause);
    var playBackController = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        rewind30Seconds,
        playPauseButton,
        forward30Seconds,
      ],
    );
    var volumeController = SliderTheme(
        child: Slider(
          onChanged: _onVolumeChanged,
          value: _currentVolume,
          divisions: 10,
          label: (10*_currentVolume).toString(),
        ),
        data: _sliderThemeData);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Color(0xFF120c28),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          thumbnail,
          slider,
          heading,
          publisher,
          playBackController,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(
                  _currentVolume == 0 ? Icons.volume_off : Icons.volume_down,
                  color: Colors.white,
                ),
              ),
              Container(
                child: volumeController,
                width: 0.7 * MediaQuery.of(context).size.width,
              ),
              Icon(
                Icons.volume_up,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSliderPositionChanged(double value) {
    setState(() {
      _seek(seconds: value.toInt());
    });
  }

  void _onVolumeChanged(double value) {
    setState(() {
      _currentVolume = value;
      _audioPlayer.setVolume(_currentVolume);
    });
  }

  void _onTogglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (!_isPlaying)
        _audioPlayer.pause();
      else {
        _audioPlayer.resume();
      }
    });
  }

  void _seek({int seconds}) {
    setState(() {
      _audioPlayer.seek(
        Duration(
            seconds: (seconds < 0)
                ? 0
                : (seconds > _totalDuration) ? _totalDuration : seconds),
      );
    });
  }

  void play() async {
    int res = await _audioPlayer.play(widget.url);
    if (res == 1) {
      int dur = (await _audioPlayer.getDuration() / 1000).ceil();
      setState(() {
        result = 1;
        _totalDuration = dur.toDouble();
      });
    }
  }

  void _handleAudioPositionStateChange(Duration event) {
    setState(() => _currentPosition = event.inSeconds.toDouble());
  }
}
