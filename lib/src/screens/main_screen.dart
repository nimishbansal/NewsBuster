import 'package:flutter/material.dart';

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



class _BottomNavTab{
  final String name;

  final String iconFileName;

  /// Screen to be displayed in body depending on active navigation item.
  final Widget screen;

  _BottomNavTab({this.name, this.iconFileName, this.screen});

}

var _bottomNavTabs = [
  _BottomNavTab(name: 'Trending', iconFileName: 'trending.png', screen: TrendingScreen()),
  _BottomNavTab(name: 'Search', iconFileName: 'search.png', screen: SearchScreen()),
  _BottomNavTab(name: 'Home', iconFileName: 'home.png', screen: HomeScreen()),
  _BottomNavTab(name: 'Recent', iconFileName: 'recent.png', screen: RecentScreen()),
  _BottomNavTab(name: 'Bookmark', iconFileName: 'bookmarks.png', screen: BookmarkScreen()),
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
      body: _bottomNavTabs[_currentIndex].screen,
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

  void _onNavTapped(int index, BuildContext context) async {
    setState(() {
      _currentIndex = index;
    });
  }
}
