import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suizerli/BLOC/mail/mail_bloc.dart';
import 'package:suizerli/Const/strings.dart';

DateTime currentBackPressTime;

class NavigationExit extends StatelessWidget {
  const NavigationExit({Key key, @required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.teal,
        alignment: Alignment.centerLeft,
        onPressed: () => onBackPressed());
  }

  void onBackPressed() {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: exit_warning);

      BlocProvider.of<MailBloc>(context).add(UnInitialize());
    } else
      SystemNavigator.pop();
  }
}
