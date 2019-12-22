part of 'mail_bloc.dart';

@immutable
abstract class MailEvent extends Equatable {
  const MailEvent();

  @override
  List<Object> get props => [];
}

class UnInitialize extends MailEvent {}

class EmailSubmitted extends MailEvent {
  final String email;

  const EmailSubmitted({
    @required this.email,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'Submitted { '
        'email: $email'
        ' }';
  }
}

class PasswordSubmitted extends MailEvent {
  final String password;

  const PasswordSubmitted({
    @required this.password,
  });

  @override
  List<Object> get props => [password];

  @override
  String toString() {
    return 'Submitted { '
        'password: $password'
        ' }';
  }
}

class NewUserSubmitted extends MailEvent {
  final String username;
  final String password;

  const NewUserSubmitted({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [password, username];

  @override
  String toString() {
    return 'Submitted { '
        'username: $username,'
        'password: $password'
        ' }';
  }
}
