import 'package:flutter/material.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';
import 'recent_screen.dart';
import 'search_screen.dart';
import 'trending_screen.dart';

const _kBottomNavColor = Color.fromRGBO(70, 78, 85, 1);

final homeNavigationItem = BottomNavigationBarItem(
  backgroundColor: _kBottomNavColor,
  title: Text(''),
  icon: ImageIcon(
    AssetImage("assets/Images/navigation_icons/home.png"),
  ),
);

final trendingNavigationItem = BottomNavigationBarItem(
  backgroundColor: _kBottomNavColor,
  title: Text(''),
  icon: ImageIcon(
    AssetImage("assets/Images/navigation_icons/trending.png"),
  ),
);

final searchNavigationItem = BottomNavigationBarItem(
  backgroundColor: _kBottomNavColor,
  title: Text(''),
  icon: ImageIcon(
    AssetImage("assets/Images/navigation_icons/search.png"),
  ),
);

final recentNavigationItem = BottomNavigationBarItem(
  backgroundColor: _kBottomNavColor,
  title: Text(''),
  icon: ImageIcon(
    AssetImage("assets/Images/navigation_icons/recent.png"),
  ),
);

final bookmarkNavigationItem = BottomNavigationBarItem(
  backgroundColor: _kBottomNavColor,
  title: Text(''),
  icon: ImageIcon(
    AssetImage("assets/Images/navigation_icons/bookmarks.png"),
  ),
);

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

  /// Children to be displayed in body depending on active navigation item.
  List<Widget> _children;

  /// Title for currently Selected Screen.
  String _title = "Home";

  @override
  void initState() {
    super.initState();
    _children = [
      TrendingScreen(),
      SearchScreen(),
      HomeScreen(),
      RecentScreen(),
      BookmarkScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _kBottomNavColor,
        title: Text(_title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme:
            IconThemeData(color: Colors.white, opacity: 1, size: 34),
        unselectedIconTheme:
            IconThemeData(color: Colors.white70, opacity: 0.8, size: 20),
        onTap: (index) => _onNavTapped(index, context),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: _kBottomNavColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items: [
          trendingNavigationItem,
          searchNavigationItem,
          homeNavigationItem,
          recentNavigationItem,
          bookmarkNavigationItem,
        ],
      ),
    );
  }

  void _onNavTapped(int index, BuildContext context) async {
    // TODO: handle single control for ordering of nav-items
    if (index == 1) {
      await showSearch(context: context, delegate: ArticleSearch());
      return;
    }
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Trending';
          }
          break;
        case 1:
          {
            _title = 'Search';
          }
          break;
        case 2:
          {
            _title = 'Home';
          }
          break;
        case 3:
          {
            _title = 'Recent';
          }
          break;
        case 4:
          {
            _title = 'Bookmarks';
          }
          break;
      }
    });
  }
}
