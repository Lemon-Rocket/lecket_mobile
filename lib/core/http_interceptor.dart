import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';

class AuthenticationInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    data.headers[HttpHeaders.contentTypeHeader] = "application/json";
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}
