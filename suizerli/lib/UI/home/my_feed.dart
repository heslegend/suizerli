import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suizerli/UI/home/feed/feed_item.dart';

class MyFeed extends StatefulWidget {
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  static Image navArt = Image.asset('images/nav/nav_art.jpg', fit: BoxFit.cover);
  static Image navSports = Image.asset('images/nav/nav_sport_w.jpg', fit: BoxFit.cover);
  static Image navOutdoor = Image.asset('images/nav/nav_outdoor.jpg', fit: BoxFit.cover);
  static Image navTech = Image.asset('images/nav/nav_tech.jpg', fit: BoxFit.cover);
  static Image navBar = Image.asset('images/nav/nav_bar.jpg', fit: BoxFit.cover);
  static Image navFood = Image.asset('images/nav/nav_food.jpg', fit: BoxFit.cover);
  static Image navBook = Image.asset('images/nav/nav_books.jpg', fit: BoxFit.cover);
  static Image navCinema = Image.asset('images/nav/nav_cinema.jpg', fit: BoxFit.cover);
  static Image navTravel = Image.asset('images/nav/nav_travel.jpg', fit: BoxFit.cover);
  static Image navMusic = Image.asset('images/nav/nav_music.jpg', fit: BoxFit.cover);

  static List<Image> _categoryImages = [
   navArt, navSports, navOutdoor, navTech, navBar, navFood, navBook, navCinema, navMusic, navTravel
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
    Tab(text: "Comedy"),
    Tab(text: "Travel"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return DefaultTabController(length: _categoryTabs.length, child: sliverScrollView());
  }

  Widget sliverScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: 200.0,
          pinned: true,
          title: Text("SUIZERLI."),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: _categoryImages[currentIndex],
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            tabs: _categoryTabs,
            onTap: (int index) => _setCategoryImage(index),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 275.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: FeedItem(),
              );
            },
          ),
        ),
      ],
    );
  }

  void _setCategoryImage(int index) {
    currentIndex = index;
    setState(() {
    });
  }
}
