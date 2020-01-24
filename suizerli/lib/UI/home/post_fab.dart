import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

const String no_state = "";
const String go_state = "go";
const String idle_state = "idle";

class PostFAB extends StatefulWidget {
  PostFAB({Key key}) : super(key: key);

  @override
  _PostFABState createState() => _PostFABState();
}

class _PostFABState extends State<PostFAB> {
  String _fabAnimationState = no_state;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        height: 60,
        width: 60,
        child: FlareActor(
          'assets/animations/PostFAB.flr',
          alignment: Alignment.center,
          animation: _fabAnimationState,
          fit: BoxFit.fill,
        ),
      ),
      onPressed: _switchAnimationState,
    );
  }


  void _switchAnimationState() {
    setState(() {
      if (_fabAnimationState == no_state || _fabAnimationState == idle_state) {
        _fabAnimationState = go_state;
        print("set animationState to ${_fabAnimationState.toString()}");
      } else if (_fabAnimationState == go_state) {
        _fabAnimationState = idle_state;
        print("set animationState to ${_fabAnimationState.toString()}");
      }
    });
  }
}
