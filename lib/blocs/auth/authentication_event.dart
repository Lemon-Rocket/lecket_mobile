part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSucceeded extends AuthenticationEvent {
  final AuthenticationResponse authenticationResponse;

  const AuthenticationSucceeded({this.authenticationResponse});

  @override
  List<Object> get props => [authenticationResponse];
}
