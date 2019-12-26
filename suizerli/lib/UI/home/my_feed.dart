import 'package:flutter/material.dart';

import '../show_logo.dart';

class MyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        ShowLogo(),
        _showText(),
      ],
    );
  }

  _showText() {
    return Padding(
      padding: EdgeInsets.fromLTRB(80, 20, 50, 50),
      child: Text(
        'Welcome to your feed!',
        style: TextStyle(
            fontSize: 50, fontStyle: FontStyle.normal, color: Colors.teal),
      ),
    );
  }
}
