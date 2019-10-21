import 'package:flutter/material.dart';
import 'package:suizerli/Const/routes.dart';
import 'package:suizerli/UI/authentication/mail_form.dart';
import 'package:suizerli/UI/authentication/sign_in_form.dart';
import 'package:suizerli/UI/authentication/sign_up_form.dart';
import 'package:suizerli/UI/splash_screen.dart';

//TODO Currently not used - use for main navigation within application (after authentication)

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case mailRoute:
        return MaterialPageRoute(builder: (_) => MailForm());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInForm());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpForm());
      case homeRoute:
//        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                        child: ListView(children: <Widget>[
                  Text("Error: No Route defined for ${settings.name}"),
                  MaterialButton(
                    elevation: 5,
                    minWidth: 5,
                    height: 42,
                    color: Colors.teal,
                    onPressed: () =>
                        Router.generateRoute(homeRoute as RouteSettings),
                    // Add Navigation to Home! Will cast succeed?
                    child: Text("Return Home"),
                  )
                ]))));
    }
  }
}
