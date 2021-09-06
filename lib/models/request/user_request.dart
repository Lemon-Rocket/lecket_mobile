class UserRequest {
  String email;
  String firstName;
  String lastName;
  String password;
  int role;

  UserRequest(
      {this.email, this.firstName, this.lastName, this.password, this.role});

  UserRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    password = json['password'] as String;
    role = json['role'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['role'] = role;
    return data;
  }
}
