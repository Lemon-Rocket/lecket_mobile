import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:lecket_mobile/blocs/auth/authentication_bloc.dart';
import 'package:lecket_mobile/core/injection_container.dart';

// import 'package:lecket_mobile/core/error/failures.dart';
// import 'package:lecket_mobile/models/user.dart';
import 'package:lecket_mobile/services/lecket_api/services/auth.dart';
import 'package:lecket_mobile/blocs/utils.dart';
// import 'package:lecket_mobile/core/user_repository.dart';
// import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final AuthenticationService auth;
  LoginBloc({this.auth}) : super(LoginBlocInitial());

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    if (event is LoginStarted) {
      yield LoginInProgress();

      final body = UtilsBlocAuth().bodyLogin(event.email, event.password);

      final responseUser = await auth.loginUser(body);

      yield responseUser.fold(
        (l) => LoginFailure(message: l.message),
        (r) {
          // sl<UserRepository>().setUser(User.fromResponse(r));authenticationResponse
          sl<AuthenticationBloc>().add(
            AuthenticationSucceeded(authenticationResponse: r),
          );
          return LoginSuccess();
        },
      );
    }
  }
}
