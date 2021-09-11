import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lecket_mobile/models/response/authentication_response.dart';
import 'package:lecket_mobile/models/user.dart';
import 'package:meta/meta.dart';

import 'package:lecket_mobile/core/user_repository.dart';
import 'package:lecket_mobile/models/response/user_response.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AuthenticationSucceeded) {
      yield AuthenticationInProgress();
      try {
        await userRepository.setUser(event.authenticationResponse.user);
        await userRepository.setToken(event.authenticationResponse.token);
        yield AuthenticationSuccess();
      } catch (e) {
        yield AuthenticationFailure(message: e);
      }
    }
  }
}
