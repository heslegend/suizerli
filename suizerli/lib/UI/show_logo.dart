import 'package:flutter/material.dart';

class ShowLogo extends StatelessWidget {
  const ShowLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logoHero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 30.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 125.0,
          child: Image.asset('images/suizerli_logo.png'),
        ),
      ),
    );
  }
}
