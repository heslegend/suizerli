import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suizerli/UI/home/my_feed.dart';
import 'package:suizerli/UI/home/my_profile.dart';
import 'package:suizerli/UI/home/notifications.dart';

import 'explore.dart';

class Home extends StatefulWidget {
  final String name;

  Home({@required this.name});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyFeed(),
    Explore(),
    Notifications(),
    MyProfile(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPageView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget(
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Post',
          child: ImageIcon(
            AssetImage('icons/suizerli_icon_green.png'),
            size: 45.0,
            color: Colors.teal,
          ),
          elevation: 4.0,
          backgroundColor: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.grey,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Feed"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text("Notifications"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text("Profile"),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onBottomNavigationItemTapped,
          fixedColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: _widgetOptions,
    );
  }

  void onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
