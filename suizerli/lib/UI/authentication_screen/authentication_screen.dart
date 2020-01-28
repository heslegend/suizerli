import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_event.dart';
import 'package:suizerli/BLOC/mail/mail_bloc.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/authentication_screen/sign_in_form.dart';
import 'package:suizerli/UI/authentication_screen/sign_up_form.dart';
import 'package:suizerli/UI/splash_screen/splash_screen.dart';

import 'mail_form.dart';

class AuthenticationScreen extends StatelessWidget {
  final UserRepository _userRepository;

  AuthenticationScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<MailBloc>(
          create: (context) => MailBloc(userRepository: _userRepository),
          child: ListView(children: <Widget>[
            BlocBuilder<MailBloc, MailState>(builder: (context, state) {
              if (state is NotInitialized) {
                return MailForm(
                  userRepository: _userRepository,
                );
              } else if (state is SignIn)
                return SignInForm(
                  userRepository: _userRepository,
                );
              else if (state is SignUp) {
                return SignUpForm(
                  userRepository: _userRepository,
                );
              } else if (state is SignedIn || state is SignedUp) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
              }
              return SplashScreen();
            })
          ]),
        ));
  }
}
