part of 'mail_bloc.dart';

@immutable
abstract class MailState extends Equatable {
  const MailState();

  @override
  List<Object> get props => [];
}

class NotInitialized extends MailState {}

class SignIn extends MailState {}

class SignUp extends MailState {}

class SignedIn extends MailState {}

class SignedUp extends MailState {}

