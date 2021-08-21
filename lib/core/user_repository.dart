import 'package:lecket_mobile/models/user.dart';
// import 'package:';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();

  factory UserRepository() {
    return _userRepository;
  }

  User _user;
  String _accessToken = "";

  User getUserRepository() {
    return _user;
  }

  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void cleanUserRepository() {
    _user = null;
    _accessToken = null;
  }

  UserRepository._internal();
}
