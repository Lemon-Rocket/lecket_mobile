import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:lecket_mobile/services/lecket_api/lecket_api.dart';

import 'http_interceptor.dart';

final serviceLocator = GetIt.instance;

GetIt get sl => serviceLocator;

void init() {
  //BLoc
  //Services
  //Api
  final String urlLecket = 'http://3.133.116.62';
  final clientLecket = HttpClientWithInterceptor.build(
    interceptors: [AuthenticationInterceptor()],
  )..badCertificateCallback = ((cert, host, port) => true);
  sl.registerLazySingleton(
      () => LecketApi(client: clientLecket, baseUrl: urlLecket));
}
