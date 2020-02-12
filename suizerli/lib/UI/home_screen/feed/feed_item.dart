import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suizerli/UI/home_screen/feed/feed_item_detail.dart';
import 'package:suizerli/UI/util/icons.dart';

class FeedItem extends StatefulWidget {
  final int _index;

  FeedItem({Key key, int index})
      : _index = index,
        super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool saveButtonActiveState = false;
  bool commentButtonActiveState = false;
  bool suizButtonActiveState = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: '${widget._index}',
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/sitting.jpg"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  titleText(),
                  divider(),
                  authorText(),
                  buttonBar()
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return FeedItemDetail();
        }));
      },
    );
  }

  Container picture() {
    return Container(
        height: 50,
        width: double.infinity,
        child: Image.network(
          'https://picsum.photos/300?blur',
          fit: BoxFit.cover,
        ));
  }

  Padding titleText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Why maldon salt is the best salt!",
        style: TextStyle(
            fontFamily: 'SegoeUi', fontSize: 20.0, color: Colors.white),
      ),
    );
  }

  Padding divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        height: 1.0,
        thickness: 1.0,
        indent: 190,
        endIndent: 190,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }

  Text authorText() {
    return Text(
      "by Rufus du Sol on Jan, 11 2020",
      style: TextStyle(
          fontFamily: 'SegoeUi',
          fontSize: 12.0,
          color: Colors.white.withOpacity(0.8)),
    );
  }

  ButtonBar buttonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.save),
            color: saveButtonActiveState ? Colors.teal : Colors.grey,
            onPressed: () =>
                setState(() => saveButtonActiveState = !saveButtonActiveState)),
        IconButton(
            icon: Icon(Icons.comment),
            color: commentButtonActiveState ? Colors.teal : Colors.grey,
            onPressed: () => setState(
                () => commentButtonActiveState = !commentButtonActiveState)),
        IconButton(
            icon: Icon(SuizerliLogo.suizerli_logo_down),
            color: suizButtonActiveState ? Colors.teal : Colors.grey,
            onPressed: () =>
                setState(() => suizButtonActiveState = !suizButtonActiveState))
      ],
    );
  }
}
