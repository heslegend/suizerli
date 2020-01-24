import 'package:flutter/material.dart';
import 'package:suizerli/Representation/Icons/suizerli_logo_icons.dart';

class FeedItemDetail extends StatefulWidget {
  FeedItemDetail({Key key}) : super(key: key);

  @override
  _FeedItemDetailState createState() => _FeedItemDetailState();
}

class _FeedItemDetailState extends State<FeedItemDetail> {
  bool saveButtonActiveState = false;
  bool commentButtonActiveState = false;
  bool suizButtonActiveState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: '0',
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: SizedBox.expand(
                child: Card(
                  color: Colors.white.withOpacity(0.2),
                  child: Card(
                    color: Colors.white,semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    elevation: 5,
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.network(
                              'https://picsum.photos/300?grayscale&blur',
                              fit: BoxFit.cover,
                            )),
                        Text(
                          "Why maldon salt is the best salt!",
                          style: TextStyle(
                              fontFamily: 'SegoeUi', fontSize: 20.0, color: Colors.teal),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            height: 2.0,
                            thickness: 1.0,
                            indent: 170,
                            endIndent: 170,
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
                ),
              ),
            )
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}