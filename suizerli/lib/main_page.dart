import 'package:flutter/material.dart';
import 'package:suizerli/Login/authentication.dart';
import 'package:suizerli/Login/login_route.dart';
import 'package:suizerli/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white,
      ),
      home: RootPage(auth: Auth(),),
    );
  }
}
