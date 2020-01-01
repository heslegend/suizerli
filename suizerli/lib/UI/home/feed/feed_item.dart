import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  FeedItem({Key key}) : super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'images/woods.jpg',
                  fit: BoxFit.fill,
                )),
            Text(
                "Why maldon salt is the best salt!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:20.0,
            ),),
          ],
        ),
      ),
    );
  }
}
