import 'package:flutter/material.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';
import 'recent_screen.dart';
import 'search_screen.dart';
import 'trending_screen.dart';

const _kBottomNavColor = Color.fromRGBO(70, 78, 85, 1);
const selectedBottomNavIconTheme =
    IconThemeData(color: Colors.white, opacity: 1, size: 34);
const unselectedBottomNavIconTheme =
    IconThemeData(color: Colors.white70, opacity: 0.8, size: 20);

const _navIconPath = "assets/Images/navigation_icons/";

class _BottomNavTab {
  final String name;

  final String iconFileName;

  _BottomNavTab({this.name, this.iconFileName});
}

var _bottomNavTabs = [
  _BottomNavTab(name: 'Trending', iconFileName: 'trending.png'),
  _BottomNavTab(
    name: 'Search',
    iconFileName: 'search.png',
  ),
  _BottomNavTab(
    name: 'Home',
    iconFileName: 'home.png',
  ),
  _BottomNavTab(
    name: 'Recent',
    iconFileName: 'recent.png',
  ),
  _BottomNavTab(
    name: 'Bookmark',
    iconFileName: 'bookmarks.png',
  ),
];

/// This is the Main screen that will have all 5 navigation items
/// defined above(homeNavigationItem, trendingNavigationItem etc)
///
/// By default HomeScreen will launch HomeFragment(index 0).
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Index of current navigation item.
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _kBottomNavColor,
        title: Text(_bottomNavTabs[_currentIndex].name),
      ),
      body: _getScreenFromCurrentIndex(_bottomNavTabs[_currentIndex])
          as StatefulWidget,
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: selectedBottomNavIconTheme,
        unselectedIconTheme: unselectedBottomNavIconTheme,
        onTap: (index) => _onNavTapped(index, context),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: _kBottomNavColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items: [
          for (final navTab in _bottomNavTabs)
            BottomNavigationBarItem(
              backgroundColor: _kBottomNavColor,
              title: Text(''),
              icon: ImageIcon(
                AssetImage(_navIconPath + navTab.iconFileName),
              ),
            )
        ],
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
        return HomeScreen(articleType: ArticlesType.Home);
      case 'Trending':
        return TrendingScreen(articleType: ArticlesType.Trending);
      case 'Recent':
        return RecentScreen(articleType: ArticlesType.Recent);
      case 'Bookmark':
        return BookmarkScreen();
      case 'Search':
        return SearchScreen();
    }
    return Container();
  }
}
