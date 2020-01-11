import 'package:flutter/material.dart';
import 'package:suizerli/Representation/Icons/suizerli_logo_icons.dart';

class FeedItem extends StatefulWidget {
  FeedItem({Key key}) : super(key: key);

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool saveButtonActiveState = false;
  bool commentButtonActiveState = false;
  bool suizButtonActiveState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
                  fontFamily: 'SegoeUi', fontSize: 20.0, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 190,
                endIndent: 190,
                color: Colors.teal,
              ),
            ),
            Text(
              "by Rufus du Sol on Jan, 11 2020",
              style: TextStyle(
                  fontFamily: 'SegoeUi',
                  fontSize: 12.0,
                  color: Colors.grey),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.save),
                    color: saveButtonActiveState ? Colors.teal : Colors.grey,
                    onPressed: () => setState(
                        () => saveButtonActiveState = !saveButtonActiveState)),
                IconButton(
                    icon: Icon(Icons.comment),
                    color: commentButtonActiveState ? Colors.teal : Colors.grey,
                    onPressed: () => setState(() =>
                        commentButtonActiveState = !commentButtonActiveState)),
                IconButton(
                    icon: Icon(SuizerliLogo.suizerli_logo_down),
                    color: suizButtonActiveState ? Colors.teal : Colors.grey,
                    onPressed: () => setState(
                        () => suizButtonActiveState = !suizButtonActiveState))
              ],
            )
          ],
        ),
      ),
    );
  }

}
