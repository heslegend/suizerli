import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

const String idle_state = "idle";
const String open_state = "open";
const String close_state = "close";

class PostFAB extends StatefulWidget {
  PostFAB({Key key}) : super(key: key);

  @override
  _PostFABState createState() => _PostFABState();
}

class _PostFABState extends State<PostFAB> {
  String _fabAnimationState = idle_state;
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    print("called widget build");
    return FloatingActionButton(
      child: Container(
        height: 60,
        width: 60,
        child: FlareActor(
          'assets/animations/PostFAB.flr',
          alignment: Alignment.center,
          animation: idle_state,
          fit: BoxFit.fill,
          controller: controls,
        ),
      ),
      onPressed: _switchAnimationState,
    );
  }

  void _playOpenPostAnimation() {
    controls.play("open");
  }

  void _playClosePostAnimation() {
    controls.play("close");
  }

  void _switchAnimationState() {
    setState(() {
      if (_fabAnimationState == idle_state || _fabAnimationState == close_state) {
        _playOpenPostAnimation();
        _fabAnimationState = open_state;
      } else if (_fabAnimationState == open_state) {
        _playClosePostAnimation();
        _fabAnimationState = close_state;
      }
    });
  }
}
