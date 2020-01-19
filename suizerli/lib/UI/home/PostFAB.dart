import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostFab extends StatefulWidget{
  @override
  _PostFabState createState() => _PostFabState();
}


class _PostFabState extends State<PostFab> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
  Animation<double> _animateIcon;
  Curve _curve = Curves.easeOut;


  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    ..addListener(() {
      setState(() {

      });
    });
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(
      begin: Colors.white,
      end: Colors.red
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve
      )
    ));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate(){
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }


  Widget toggle () {
    return FloatingActionButton(
      foregroundColor: _animateColor.value,
      onPressed: animate,
      tooltip: "Post",
      child: AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return toggle();
  }


}