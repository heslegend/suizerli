import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// App is started - check if user is already authenticated
class AppStarted extends AuthenticationEvent {}

// User Logged In -> Home Screen will be shown
class LoggedIn extends AuthenticationEvent {}

// User Logged Out -> Email Screen will be shown
class LoggedOut extends AuthenticationEvent {}