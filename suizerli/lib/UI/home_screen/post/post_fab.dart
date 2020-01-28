import 'package:flutter/material.dart';
import 'package:suizerli/UI/home_screen/post/post_pop_up_route.dart';
import 'package:suizerli/UI/util/icons.dart';

class PostFAB extends StatefulWidget {
  PostFAB({Key key}) : super(key: key);

  @override
  _PostFABState createState() => _PostFABState();
}

class _PostFABState extends State<PostFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'postWidget',
      child: Icon(
        SuizerliLogo.suizerli_logo_up,
        color: Colors.black,
        size: 40.0,
      ),
      backgroundColor: Colors.white,
      onPressed: _onPostButtonPressed,
    );
  }

  void _onPostButtonPressed() {
    Navigator.of(context).push(PostPopUpRoute());
  }
}
