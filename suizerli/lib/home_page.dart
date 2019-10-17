import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suizerli/Login/authentication.dart';
import 'package:suizerli/Login/base_authentication.dart';
import 'package:suizerli/Login/login_route.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.logoutCallback});

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Suizerli - home"),
        actions: <Widget>[
          FlatButton(
              child: Text("Logout",
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white,
              )),
        onPressed: signOut)

        ],
      ),
    );
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

}