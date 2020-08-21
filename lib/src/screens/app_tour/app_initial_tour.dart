import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../main_screen.dart';

const skipTourForTesting = true;

String _appTourAssetPath = 'assets/Images/app_tour/';

class _TourScreen {
  final String text;
  final String imagePath;

  _TourScreen({this.text, this.imagePath});
}

/// Pages for the screens thar are displayed in app tour.
List<_TourScreen> _screens = [
  _TourScreen(text: "Find Trending And\nAuthentic News", imagePath: '1.png'),
  _TourScreen(
      text: "Listen To Podcasts\nAnytime, Anywhere", imagePath: '2.png'),
  _TourScreen(text: "Renowned And\nReliable Sources", imagePath: '3.png')
];

/// The _Page is responsible to design a page in PageView of AppTour
class _Page extends StatelessWidget {
  final _TourScreen tourScreen;
  final PageController pageController;
  final int totalPages;
  final int currentIndex;

  const _Page(
      {Key key,
      this.pageController,
      this.totalPages,
      this.tourScreen,
      this.currentIndex})
      : assert(
            totalPages != null && pageController != null && tourScreen != null),
        super(key: key);

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
                top: 0.23 * _screenHeight,
                left: 0.12 * _screenWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _imageWidth,
                    height: _imageHeight,
                    child: Image.asset(
                      _appTourAssetPath + tourScreen.imagePath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.61 * _screenHeight,
                left: 0.17 * _screenWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    tourScreen.text,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _handleOnTapDone(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => !kIsWeb ? MainScreen() : MainScreen(),
      ), //MaterialPageRoute
    );
  }
}

/// App tour that is shown once user launches the app for the first time.
class AppInitialTour extends StatefulWidget {
  @override
  _AppInitialTourState createState() => _AppInitialTourState();
}

class _AppInitialTourState extends State<AppInitialTour> {
  PageController _pageController;

  /// Tells the index of current page on pageView.
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    var _buttonTextStyle = TextStyle(fontSize: 18, color: Colors.grey[600]);

    PageView pageView = PageView(
      children: [
        for (int i = 0; i < _screens.length; i++)
          _Page(
              pageController: _pageController,
              tourScreen: _screens[i],
              totalPages: _screens.length,
              currentIndex: i),
      ],
      onPageChanged: (int page) {
        setState(() {
          _currentIndex = page;
        });
      },
      controller: _pageController,
    );
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Colors.transparent,
              )),
      body: Container(
        child: 1 == 0?Text("hmm"):Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: pageView, width: _screenWidth, height: 0.80*_screenHeight,),
            // Current Index Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _screens.length; i++)
                  Container(
                    margin: EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color:
                            i == _currentIndex ? Color(0xFF45d6b9) : Colors.white,
                        shape: BoxShape.circle),
                  )
              ],
            ),

            SizedBox(
              height: 0.0274 * _screenHeight,
            ),
            // Skip & Next Controls
            Row(
              children: [
                _currentIndex < _screens.length
                    ? FlatButton(
                        child: Text(
                          'Skip',
                          style: _buttonTextStyle,
                        ),
                        onPressed: () => _handleOnTapDone(context),
                      )
                    : Container(),
                Spacer(),
                FlatButton(
                  child: Text(
                    _currentIndex < _screens.length - 1 ? 'Next' : 'Done',
                    style: _buttonTextStyle,
                  ),
                  onPressed: _currentIndex < _screens.length - 1
                      ? () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.decelerate);
                        }
                      : () => _handleOnTapDone(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _handleOnTapDone(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => !kIsWeb ? MainScreen() : MainScreen(),
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
