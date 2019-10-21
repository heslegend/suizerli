import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:suizerli/Repository/user_repository.dart';

part 'mail_event.dart';

part 'mail_state.dart';

class MailBloc extends Bloc<MailEvent, MailState> {
  UserRepository _userRepository;

  MailBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  MailState get initialState => NotInitialized();

  @override
  Stream<MailState> mapEventToState(MailEvent event) async* {
    if (event is UnInitialize) {
      yield* _mapUnInitializeToState();
    } else if (event is EmailSubmitted) {
      yield* _mapEmailSubmittedToState(event.email);
    } else if (event is PasswordSubmitted) {
      yield *_mapPasswordSubmittedToState(event.password);
    } else if (event is NewUserSubmitted) {
      yield* _mapNewUserSubmittedToState(event.username, event.password);
    }
  }

  Stream<MailState> _mapUnInitializeToState() async*{
    yield NotInitialized();
  }

  Stream<MailState> _mapEmailSubmittedToState(String email) async* {
    bool emailExisting = await _userRepository.checkEmailAlreadyExisting(email);
    _userRepository.userEmail = email;

    if (emailExisting) yield SignIn();
    else yield SignUp();
  }

  Stream<MailState> _mapPasswordSubmittedToState(String password) async* {
    await _userRepository.signInWithCredentials(password);
    yield SignedIn();
  }

  Stream<MailState> _mapNewUserSubmittedToState(String username, String password) async* {
    await _userRepository.signUp(password: password);
    yield SignedUp();
  }

}
