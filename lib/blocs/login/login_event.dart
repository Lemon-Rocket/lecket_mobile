part of 'login_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

class LoginStarted extends LoginBlocEvent {
  final String email;
  final String password;

  const LoginStarted({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
