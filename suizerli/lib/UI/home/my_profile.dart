import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_event.dart';

import '../show_logo.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(child: _body());
  }

  Widget _body() {
    return ListView(
      children: <Widget>[ShowLogo(), _showText(), _showLogOutButton()],
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

  _signOut() {
    try {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoggedOut(),
      );
    } catch (e) {
      print(e);
    }
  }
}
