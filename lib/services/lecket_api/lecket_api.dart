import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'package:lecket_mobile/core/error/failures.dart';

enum HttpMethod { get, post }

class LecketApi {
  final HttpClientWithInterceptor client;
  final String baseUrl;

  const LecketApi({@required this.client, @required this.baseUrl});

  Future<Either<Failure, T>> _request<T>(
      {@required String url,
      @required HttpMethod method,
      T body,
      Map<String, String> headers}) async {
    try {
      Response response;
      final uri = Uri.parse('$baseUrl$url');
      if (method == HttpMethod.get) {
        response = await client.get(uri);
      } else if (method == HttpMethod.post) {
        response = await client.post(uri, body: body, headers: headers);
      }

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as T;
        //return Right(jsonResponse);
      } else {
        return Left(ServerStatusFailure(statusCode: response.statusCode));
      }
    } on SocketException {
      return Left(ServerFailure('No internet connection'));
    } on HttpException {
      return Left(ServerFailure("Couldn't finish the request"));
    } on FormatException {
      return Left(ServerFailure('Bad response format'));
    }
  }

  Future<Either<Failure, T>> post<T>({
    @required String url,
    @required T body,
    Map<String, String> headers,
  }) =>
      _request<T>(
          url: url, method: HttpMethod.post, body: body, headers: headers);

  Future<Either<Failure, T>> get<T>(String url) =>
      _request<T>(url: url, method: HttpMethod.get);
}
