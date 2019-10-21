import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/mail/mail_bloc.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/authentication/navigation_exit.dart';

import '../show_logo.dart';

class MailForm extends StatefulWidget {
  final UserRepository _userRepository;

  MailForm({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  State<MailForm> createState() => _MailFormState();
}

class _MailFormState extends State<MailForm> {
  MailBloc _mailBloc;
  String _email = "";
  final _formKey = GlobalKey<FormState>();

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _mailBloc = BlocProvider.of<MailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: NavigationExit(context: context),
            ),
            ShowLogo(),
            _showEmailInput(),
            _showNextButton("NEXT")
          ],
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 250, 50, 0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        initialValue: _userRepository.userEmail,
        decoration: InputDecoration(
            hintText: "Email", icon: Icon(Icons.mail, color: Colors.grey)),
        validator: (value) => value.isEmpty ? "Email can\'t be empty" : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showNextButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.fromLTRB(200, 20, 50, 50),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: Colors.teal,
        onPressed: () => _submitMail(),
        child: Text(buttonText),
      ),
    );
  }

  void _submitMail() {
    if (_formKey.currentState.validate()) _formKey.currentState.save();
    _mailBloc.add(EmailSubmitted(email: _email));
  }
}
