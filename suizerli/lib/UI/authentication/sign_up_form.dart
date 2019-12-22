import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/mail/mail_bloc.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/authentication/navigation_exit.dart';

import '../show_logo.dart';

class SignUpForm extends StatefulWidget {
  final UserRepository _userRepository;
  final _formKey = GlobalKey<FormState>();

  SignUpForm({
    Key key,
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  MailBloc _mailBloc;
  String _username;
  String _password;
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
              child: NavigationExit(
                context: context,
              ),
            ),
            ShowLogo(),
            _showUserNameInput(),
            _showPasswordInput(),
            _showNextButton("NEXT")
          ],
        ),
      ),
    );
  }

  Widget _showUserNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 200, 50.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Username',
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'Username can\'t be empty!' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 50.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'Password can\'t be empty!' : null,
        onSaved: (value) => _password = value.trim(),
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
        onPressed: () => _submitPasswordAndEmail(),
        child: Text(buttonText),
      ),
    );
  }

  void _submitPasswordAndEmail() {
    if (_formKey.currentState.validate()) _formKey.currentState.save();
    _mailBloc.add(NewUserSubmitted(password: _password));
  }
}
