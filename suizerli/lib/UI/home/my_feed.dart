import 'package:flutter/material.dart';
import 'package:suizerli/UI/home/feed/feed_item.dart';

class MyFeed extends StatefulWidget {
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  static List<Widget> _recommendationList = [FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem(), FeedItem()];

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return ListView(
      children:  _recommendationList,
    );
  }

}
