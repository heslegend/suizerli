import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suizerli/UI/home/feed/feed_item.dart';

class MyFeed extends StatefulWidget {
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  static List<Widget> _recommendationList = [
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem(),
    FeedItem()
  ];

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return DefaultTabController(
        length: 12,
        child: Container(
            child: Container(height: 100, child: sliverScrollView())));
  }

  Widget navigationTextElement(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Text(
        text,
        style:
            TextStyle(color: Colors.teal, fontFamily: 'SegoeUi', fontSize: 30),
      ),
    );
  }

  Widget displayNewsFeed() {
    return Container(
        height: 900, child: ListView(children: _recommendationList));
  }

  Widget sliverScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          expandedHeight: 150.0,
          pinned: true,
          title: Text("SUIZERLI"),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Image.asset('images/sitting.jpg',fit: BoxFit.cover),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            tabs: <Widget>[
              Tab(text: "Art"),
              Tab(text: "Food"),
              Tab(text: "Music"),
              Tab(text: "Bars"),
              Tab(text: "Movies"),
              Tab(text: "Books"),
              Tab(text: "Tech"),
              Tab(text: "Travel"),
              Tab(text: "Outdoor"),
              Tab(text: "Sports"),
              Tab(text: "Comedy"),
              Tab(text: "Salt"),
            ],
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
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
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
