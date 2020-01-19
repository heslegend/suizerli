import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suizerli/Const/images.dart';
import 'package:suizerli/UI/home/feed/feed_item.dart';

class MyFeed extends StatefulWidget {
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {

  List<Image> _categoryImages = [
    navArt,
    navSports,
    navOutdoor,
    navTech,
    navBar,
    navFood,
    navBook,
    navCinema,
    navMusic,
    navTravel
  ];

  static List<Tab> _categoryTabs = [
    Tab(text: "Art"),
    Tab(text: "Sports"),
    Tab(text: "Outdoor"),
    Tab(text: "Tech"),
    Tab(text: "Bars"),
    Tab(text: "Food"),
    Tab(text: "Books"),
    Tab(text: "Movies"),
    Tab(text: "Music"),
    Tab(text: "Travel"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return DefaultTabController(
        length: _categoryTabs.length, child: sliverScrollView());
  }

  Widget sliverScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        categoryNavigationHeader(),
        recommendationList(),
      ],
    );
  }


  Widget categoryNavigationHeader(){
    return SliverAppBar(
      floating: true,
      expandedHeight: 200.0,
      pinned: true,
      title: Text("SUIZERLI."),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: _categoryImages[currentIndex],
      ),
      bottom: categoryNavigationTabBar(),
    );
  }

  Widget categoryNavigationTabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      tabs: _categoryTabs,
      onTap: (int index) => _setCategoryImage(index),
    );
  }

  Widget recommendationList() {
    return SliverFixedExtentList(
      itemExtent: 275.0,
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: FeedItem(index: index,),
          );
        },
      ),
    );
  }

  void _setCategoryImage(int index) {
    currentIndex = index;
    setState(() {});
  }

}
