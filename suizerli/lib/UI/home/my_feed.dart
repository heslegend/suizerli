import 'package:flutter/material.dart';

class MyFeed extends StatefulWidget {
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  static List<Widget> _recommendationList = [
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.details),
            title: Text("Try fleur del sel!"),
            subtitle: Text("You won't regret it!"),
          ),
        ],
      ),
    ),

  ];

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
