import 'package:lecket_mobile/models/user.dart';

class AuthenticationResponse {
  String token;
  User user;

  AuthenticationResponse({this.token, this.user});

  AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}
