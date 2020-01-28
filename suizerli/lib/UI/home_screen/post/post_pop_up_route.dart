import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:suizerli/UI/home_screen/post/post_widget.dart';

class PostPopUpRoute extends PopupRoute {
  static const double frostAnimationStartValue = 0.0;
  static const double frostAnimationEndValue = 10.0;

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "Close";

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      new FrostTransition(
        animation: new Tween<double>(
          begin: frostAnimationStartValue,
          end: frostAnimationEndValue,
        ).animate(animation),
        child: child,
      );

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      PostWidget();
}

class FrostTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  FrostTransition({this.animation, this.child}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) => new BackdropFilter(
    filter: ImageFilter.blur(sigmaX: animation.value, sigmaY: animation.value),
    child: new Container(
      child: child,
    ),
  );
}
