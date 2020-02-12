import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/home_screen/feed/feed_widget.dart';
import 'package:suizerli/UI/home_screen/notifications_widget.dart';
import 'package:suizerli/UI/home_screen/post/post_fab.dart';
import 'package:suizerli/UI/home_screen/profile_widget.dart';

import 'explore_widget.dart';

class HomeScreen extends StatefulWidget {
  final _userRepository;

  HomeScreen({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavigationIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyFeed(),
    Explore(),
    Notifications(),
    MyProfile()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PostFAB(userRepository: widget._userRepository,),
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
          currentIndex: _bottomNavigationIndex,
          onTap: onBottomNavigationItemTapped,
          fixedColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  void pageChanged(int index) {
    setState(() {
      _bottomNavigationIndex = index;
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
      _bottomNavigationIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
