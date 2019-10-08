import 'package:flutter/material.dart';

enum FormMode {LOGIN, SIGNUP}

class LoginRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginRoute>{

  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  FormMode _formMode = FormMode.LOGIN;
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome to suizerli!"),
      ),
      body: Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              _showSecondaryButton(),
            ],
          )
      ),
    );
  }

  Widget _showCircularProgress(){
    _isLoading = false;
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container (height: 0.0, width: 0.0,);
    }
  }

  Widget _showLogo(){
    return Hero (
      tag: 'logoHero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 125.0,
          child: Image.asset('images/suizerli_logo.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? 'Email Can\'t be Empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty!' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45, 0.0, 0.0),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: Colors.teal,
        child: _formMode == FormMode.LOGIN
          ? Text('Login', style: TextStyle(fontSize: 20.0, color: Colors.white))
            : Text('Create Account', style: TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: _validateAndSubmit,
      ));
  }

  Widget _showSecondaryButton(){
    return FlatButton(
      child: _formMode == FormMode.LOGIN
          ? Text('Create an account', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : Text('Have an Account? Sign in', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN
    ? _changeFormToSignUp
    : _changeFormToLogin);
    }


  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }


  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _validateAndSubmit(){
  }

}
