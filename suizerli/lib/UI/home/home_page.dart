import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suizerli/Representation/Icons/suizerli_logo_icons.dart';
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
  bool active = false;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyFeed(),
    Explore(),
    Notifications(),
    MyProfile(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _flare(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        clipBehavior: Clip.antiAlias,
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

  Widget _flare(){
    return GestureDetector(
      child: Container(
        height: 60,
        width: 60,
          child: FlareActor(
            'assets/animations/PostFAB.flr',
            alignment: Alignment.center,
            animation: active ? 'go' : 'idle',
            fit: BoxFit.fill,
          ),
      ),
      onTap: () {
        setState(() {
          active = !active;
        });
      },
    );
  }

}
