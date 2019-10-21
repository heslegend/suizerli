import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_event.dart';
import 'package:suizerli/UI/authentication/navigation_exit.dart';
import 'package:suizerli/UI/show_logo.dart';

class Home extends StatefulWidget {
  final String name;

  Home({@required this.name});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body());
  }

  _signOut() {
    try {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoggedOut(),
      );
    } catch (e) {
      print(e);
    }
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        NavigationExit(context: context),
        ShowLogo(),
        _showText(),
        _showLogOutButton()
      ],
    );
  }

  _showText() {
    return Padding(
      padding: EdgeInsets.fromLTRB(80, 20, 50, 50),
      child: Text(
        'Welcome to suizerli!',
        style: TextStyle(
            fontSize: 50, fontStyle: FontStyle.normal, color: Colors.teal),
      ),
    );
  }

  _showLogOutButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 50.0,
        height: 42.0,
        color: Colors.teal,
        onPressed: () => _signOut(),
        child: Text("LogOut"),
      ),
    );
  }
}
