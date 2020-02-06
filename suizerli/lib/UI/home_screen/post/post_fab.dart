import 'package:flutter/material.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/home_screen/post/post_pop_up_route.dart';
import 'package:suizerli/UI/util/icons.dart';

class PostFAB extends StatefulWidget {
  final _userRepository;
  PostFAB({Key key, UserRepository userRepository}) : assert(userRepository != null), _userRepository = userRepository, super(key: key);

  @override
  _PostFABState createState() => _PostFABState();
}

class _PostFABState extends State<PostFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'postWidget',
      child: Icon(
        SuizerliLogo.suizerli_logo_up,
        color: Colors.white,
        size: 40.0,
      ),
      backgroundColor: Colors.black,
      onPressed: _onPostButtonPressed,
    );
  }

  void _onPostButtonPressed() async {
    String userName = await widget._userRepository.getUserName();
    print("Current User ${userName}");
    Navigator.of(context).push(PostPopUpRoute());
  }
}
