import 'package:flutter/material.dart';
import 'package:suizerli/UI/util/icons.dart';

class PostWidget extends StatefulWidget {
  PostWidget({Key key}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'postWidget',
        child: Material(
          color: Colors.white.withOpacity(0.15),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
            child: Column(
              children: <Widget>[
                _showTopNavigation(),
                _showSuizerliIcon(),
                _showHeadingText(),
                _showTextInputField(),
              ],
            ),
          ),
      ),
    );
  }

  Row _showTopNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
            onPressed: onPostButtonPressed),
        MaterialButton(
            child: Text(
              "Post",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            onPressed: onPostButtonPressed)
      ],
    );
  }

  Icon _showSuizerliIcon() {
    return Icon(
      SuizerliLogo.suizerli_logo_down,
      color: Colors.teal,
      size: 50,
    );
  }

  Column _showHeadingText() {
    return Column(
      children: <Widget>[
        Text(
          "New Recommendation",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        Text(
          "Let people know what you think",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: Colors.white.withOpacity(0.6)),
        )
      ],
    );
  }

  Padding _showTextInputField() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
            color: Colors.white.withOpacity(0.6)),
        decoration: InputDecoration(
            hintText: "Why I think Maldon salt is the best salt..",
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: Colors.white.withOpacity(0.6)),
                border: InputBorder.none
        ),
        maxLines: 10,
      ),
    );
  }

  void onPostButtonPressed() {
    Navigator.pop(context);
  }

  void onCloseButtonPressed() {
    Navigator.pop(context);
  }

}
