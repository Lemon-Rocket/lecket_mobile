import 'package:dartz/dartz.dart';
import 'package:lecket_mobile/models/response/authentication_response.dart';
// import 'package:lecket_mobile/models/request/user_request.dart';
import 'package:meta/meta.dart';

import 'package:lecket_mobile/core/error/failures.dart';
import 'package:lecket_mobile/models/response/user_response.dart';
import 'package:lecket_mobile/services/lecket_api/lecket_api.dart';

abstract class AuthenticationService {
  Future<Either<Failure, AuthenticationResponse>> loginUser(
      Map<String, dynamic> body);
  Future<Either<Failure, UserResponse>> registerUser(Map<String, dynamic> body);
}

class AuthenticationServiceImpl implements AuthenticationService {
  final LecketApi client;

  AuthenticationServiceImpl({@required this.client});

  @override
  Future<Either<Failure, AuthenticationResponse>> loginUser(
      Map<String, dynamic> body) async {
    final response =
        await client.post<Map<String, dynamic>>(url: '/', body: body);
    return response.map((r) => AuthenticationResponse.fromJson(r));
  }

  @override
  Future<Either<Failure, UserResponse>> registerUser(
      Map<String, dynamic> body) async {
    final response =
        await client.post<Map<String, dynamic>>(url: "/", body: body);
    return response.map((r) => UserResponse.fromJson(r));
  }
}
