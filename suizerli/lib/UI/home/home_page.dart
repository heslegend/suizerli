import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suizerli/UI/home/my_feed.dart';
import 'package:suizerli/UI/home/my_profile.dart';
import 'package:suizerli/UI/home/notifications.dart';
import 'package:suizerli/UI/home/recommend.dart';

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
    Recommend(),
    Notifications(),
    MyProfile(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPageView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(10.0, 10.0))
        ]),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Feed"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Post"),
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
        ),
      ),
    );
  }

  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPageView(){
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
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
