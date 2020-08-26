import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';
import 'home_gallery_screen.dart';
import 'recent_screen.dart';
import 'search_screen.dart';
import 'trending_screen.dart';

const _kBottomNavColor = Colors.white;
const selectedBottomNavIconTheme =
    IconThemeData(color: Colors.blue, opacity: 1, size: 20);
const unselectedBottomNavIconTheme =
    IconThemeData(color: Colors.black, opacity: 1, size: 20);

const _navIconPath = "assets/Images/navigation_icons/";

class _BottomNavTab {
  final String name;

  final String iconFileName;

  _BottomNavTab({this.name, this.iconFileName});
}

var _bottomNavTabs = [
//  _BottomNavTab(name: 'Trending', iconFileName: 'trending.png'),
  _BottomNavTab(name: 'Search', iconFileName: 'search.png'),
  _BottomNavTab(name: 'Home', iconFileName: 'home.png'),
//  _BottomNavTab(name: 'Recent', iconFileName: 'recent.png'),
  _BottomNavTab(name: 'Bookmark', iconFileName: 'bookmarks.png'),
];

/// index of home page in bottom navigation tabs
int _homeIndex = _bottomNavTabs.indexOf(_bottomNavTabs.where((element) => element.name == 'Home').toList()[0]);

/// This is the Main screen that will have all 5 navigation items
/// defined above(homeNavigationItem, trendingNavigationItem etc)
///
/// By default [MainScreen] will launch Home.
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Index of current navigation item.
  int _currentIndex = _homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.transparent,
          )),
      body: _getScreenFromCurrentIndex(_bottomNavTabs[_currentIndex])
          as StatefulWidget,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4.0,
            offset: Offset(0.0, 0.1),
          ),
        ]),
        child: BottomNavigationBar(
          selectedIconTheme: selectedBottomNavIconTheme,
          unselectedIconTheme: unselectedBottomNavIconTheme,
          onTap: (index) => _onNavTapped(index, context),
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: _kBottomNavColor,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          currentIndex: _currentIndex,
          items: [
            for (final navTab in _bottomNavTabs)
              BottomNavigationBarItem(
                backgroundColor: _kBottomNavColor,
                title: Text(
                  navTab.name,
                ),
                icon: ImageIcon(
                  AssetImage(_navIconPath + navTab.iconFileName),
                  size: 20,
                ),
              )
          ],
        ),
      ),
    );
  }

  void _onNavTapped(int index, BuildContext context) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getScreenFromCurrentIndex(_BottomNavTab tab) {
    switch (tab.name) {
      case 'Home':
        return OverviewHomeScreen();
//        return HomeScreen(articleType: ArticlesType.Home);
      case 'Trending':
        return TrendingScreen(articleType: ArticlesType.Trending);
      case 'Recent':
        return RecentScreen(articleType: ArticlesType.Recent);
      case 'Bookmark':
        return BookmarkScreen(articleType: ArticlesType.Bookmarks);
      case 'Search':
        return SearchScreen();
    }
    return Container();
  }
}
