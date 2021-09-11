part of 'login_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginInProgress extends LoginBlocState {}

class LoginSuccess extends LoginBlocState {}

class LoginFailure extends LoginBlocState {
  final String message;

  const LoginFailure({this.message});

  @override
  List<Object> get props => [message];
}
