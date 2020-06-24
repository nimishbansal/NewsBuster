import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:newsbuster/main.dart';
import 'package:newsbuster/screens/article_web_view.dart';

class AppInitialTour extends StatefulWidget {
  @override
  _AppInitialTourState createState() => _AppInitialTourState();
}

final page1 = PageViewModel(
  pageColor: const Color(0xFF03A9F4),
  // iconImageAssetPath: 'assets/air-hostess.png',
  bubble: Image.asset('assets/Images/app_tour/air-hostess.png'),
  body: Text(
    'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
  ),
  title: Text(
    'Flights',
  ),
  titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
  bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
  mainImage: Image.asset(
    'assets/Images/app_tour/airplane.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
);

final page2 = PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    iconImageAssetPath: 'assets/Images/app_tour/waiter.png',
    body: Text(
        'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
    ),
    title: Text('Hotels'),
    mainImage: Image.asset(
        'assets/Images/app_tour/hotel.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final page3 = PageViewModel(
    pageColor: const Color(0xFF607D8B),
    iconImageAssetPath: 'assets/Images/app_tour/taxi-driver.png',
    body: Text(
        'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
    ),
    title: Text('Cabs'),
    mainImage: Image.asset(
        'assets/Images/app_tour/taxi.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
    ),
    titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final pages = [page1, page2, page3];

class _AppInitialTourState extends State<AppInitialTour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        showNextButton: true,
        showBackButton: true,
        onTapDoneButton: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => !kIsWeb?ArticleWebView(title:"Done"):MyHomePage(title:"Done"),
            ), //MaterialPageRoute
          );
        },
        pageButtonTextStyles: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
