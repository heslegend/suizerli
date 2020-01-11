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
      height: 150,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                height: 100,
                width: double.infinity,
                child: Image.network(
                  'https://picsum.photos/300?grayscale&blur',
                  fit: BoxFit.cover,
                )),
            Text(
                "Why maldon salt is the best salt!",
            style: TextStyle(
              fontFamily: 'SegoeUi',
              fontSize:20.0,
              color: Colors.teal
            ),),
          ],
        ),
      ),
    );
  }
}
