import 'package:lecket_mobile/models/request/user_request.dart';
import 'package:lecket_mobile/models/response/role_response.dart';

class UserResponse {
  String email;
  String firstName;
  String lastName;
  int role;
  String userId;

  UserResponse(
      {this.email, this.firstName, this.lastName, this.role, this.userId});

  UserResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    role = json['role'] as int;
    userId = json['userId'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    data['userId'] = userId;
    return data;
  }
}
