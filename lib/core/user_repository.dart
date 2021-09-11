import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lecket_mobile/models/user.dart';

import 'injection_container.dart';

class UserRepository {
  // static final UserRepository _userRepository = UserRepository._internal();

  // factory UserRepository() {
  //   return _userRepository;
  // }

  // User _user;
  // String _accessToken = "";

  // User getUserRepository() {
  //   return _user;
  // }

  // void setAccessToken(String accessToken) {
  //   _accessToken = accessToken;
  // }

  // void cleanUserRepository() {
  //   _user = null;
  //   _accessToken = null;
  // }

  // UserRepository._internal();

  final String _tokenKey = "_token";
  final String _userKey = "_user";

  Future<User> getUser() async {
    final jsonString = await sl<FlutterSecureStorage>().read(key: _userKey);
    if (jsonString == null) return null;
    return User.fromJson(json.decode(jsonString) as Map<String, dynamic>);
  }

  Future<void> setUser(User newUser) async {
    return sl<FlutterSecureStorage>().write(
      key: _userKey,
      value: json.encode(newUser.toJson()),
    );
  }

  Future<String> getToken() {
    return sl<FlutterSecureStorage>().read(key: _tokenKey);
  }

  Future<void> setToken(String newToken) {
    return sl<FlutterSecureStorage>().write(key: _tokenKey, value: newToken);
  }

  Future<void> cleanUserRepository() async {
    await sl<FlutterSecureStorage>().delete(key: _userKey);
    await sl<FlutterSecureStorage>().delete(key: _tokenKey);
  }
}
