import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../main_screen.dart';

const skipTourForTesting = true;


String _appTourAssetPath = 'assets/Images/app_tour/';

class _TourScreen{
  final text;
  final imagePath;

  _TourScreen({this.text, this.imagePath});
}

/// Pages for the screens thar are displayed in app tour.
List<_TourScreen> _pages = [
  _TourScreen(text: "Find Trending And\nAuthentic News", imagePath: '1.png'),
  _TourScreen(text: "Listen To Podcasts\nAnytime, Anywhere", imagePath: '2.png'),
  _TourScreen(text: "Renowned And\nReliable Sources", imagePath: '3.png')
];

/// App tour that is shown once user launches the app for the first time.
class AppInitialTour extends StatefulWidget {
  @override
  _AppInitialTourState createState() => _AppInitialTourState();
}

class _AppInitialTourState extends State<AppInitialTour> {

  int _selectedIndex = 1;

  int _totalItems = 3;

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    var _buttonTextStyle = TextStyle(fontSize: 18, color: Colors.grey[600]);
    var _imageWidth = 0.75 * _screenWidth;
    var _imageHeight = 0.8 * _imageWidth;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: _AppTourScreenClipper(
                        screenSize: MediaQuery.of(context).size),
                child: Container(
                  width: _screenWidth,
                  height: 0.8 * _screenHeight,
                  color: Color(0xFF45d6b9),
                ),
              ),

              Positioned(
                top: 0.25 * _screenHeight,
                left: 0.12 * _screenWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _imageWidth,
                    height: _imageHeight,
                    child: Image.asset(
                      _appTourAssetPath + _pages[_selectedIndex - 1].imagePath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 0.62 * _screenHeight,
                left: 0.17 * _screenWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(_pages[_selectedIndex - 1].text, style: TextStyle(color: Colors.white, fontSize: 30),),
                ),
              )
            ],
          ),

          // Current Index Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 1; i <= _totalItems; i++)
                Container(
                  margin: EdgeInsets.all(4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color:
                          i == _selectedIndex ? Color(0xFF45d6b9) : Colors.white,
                          shape: BoxShape.circle),
                )
            ],
          ),

          SizedBox(
            height: 0.04 * _screenHeight,
          ),
          Row(
            children: [
              _selectedIndex < _totalItems
                      ? FlatButton(
                child: Text(
                  'Skip',
                  style: _buttonTextStyle,
                ),
                onPressed: () {},
              )
                      : Container(),
              Spacer(),
              FlatButton(
                child: Text(
                  _selectedIndex < _totalItems ? 'Next' : 'Done',
                  style: _buttonTextStyle,
                ),
                onPressed: _selectedIndex < _totalItems
                        ? () {
                  setState(() {
                    _selectedIndex += 1;
                  });
                }
                        : ()=>_handleOnTapDone(context),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _handleOnTapDone(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
        !kIsWeb
                ? MainScreen()
                : MainScreen(),
      ), //MaterialPageRoute
    );
  }
}

class _AppTourScreenClipper extends CustomClipper<Path> {
  final Size screenSize;

  _AppTourScreenClipper({this.screenSize});
  @override
  getClip(Size size) {
    var path = new Path();
    path.moveTo(0.0, 0.074 * screenSize.height);
    path.lineTo(0.0, 0.7 * screenSize.height);

    var firstControlPoint = Offset(size.width / 2, 0.85 * screenSize.height);
    var firstEndPoint = Offset(screenSize.width, 0.7 * screenSize.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.254 * screenSize.height);
    var secondControlPoint = Offset(0.65 * size.width, 0.45 * size.width);
    var secondEndPoint = Offset(0.486 * size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
            secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(0.08 * size.height, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
