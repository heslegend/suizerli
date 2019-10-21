import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suizerli/BLOC/authentication/authentication_bloc.dart';
import 'package:suizerli/Repository/user_repository.dart';
import 'package:suizerli/UI/home_page.dart';
import 'package:suizerli/UI/splash_screen.dart';

import 'BLOC/authentication/authentication_event.dart';
import 'BLOC/authentication/authentication_state.dart';
import 'UI/authentication/authentication_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized)
            return SplashScreen();
          else if (state is Unauthenticated)
            return AuthenticationScreen(userRepository: _userRepository);
          else if (state is Authenticated)
            return Home();
          else
            return Container(child: Text("Ouuups - something went wrong"));
        },
      ),
    );
  }
}
