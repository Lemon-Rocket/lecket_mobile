import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:lecket_mobile/blocs/auth/authentication_bloc.dart';
import 'package:lecket_mobile/blocs/login/login_bloc.dart';
import 'package:lecket_mobile/core/user_repository.dart';
import 'package:lecket_mobile/services/lecket_api/lecket_api.dart';
import 'package:lecket_mobile/services/lecket_api/services/auth.dart';

import 'http_interceptor.dart';

final serviceLocator = GetIt.instance;

GetIt get sl => serviceLocator;

void init() {
  //BLoc
  sl.registerFactory(() => LoginBloc(auth: sl()));
  sl.registerFactory(() => AuthenticationBloc(userRepository: sl()));
  //Core
  sl.registerLazySingleton(() => UserRepository());
  //Services
  sl.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl(client: sl()));
  //Api
  final String urlLecket = 'http://3.133.116.62:8080';
  final clientLecket = HttpClientWithInterceptor.build(
    interceptors: [AuthenticationInterceptor()],
  )..badCertificateCallback = ((cert, host, port) => true);
  sl.registerLazySingleton(
      () => LecketApi(client: clientLecket, baseUrl: urlLecket));
}
