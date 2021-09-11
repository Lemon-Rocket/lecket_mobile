import 'package:lecket_mobile/models/response/user_response.dart';

class User {
  String email;
  String firstName;
  String lastName;
  int role;
  String userId;

  User({this.email, this.firstName, this.lastName, this.role, this.userId});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    role = json['role'] as int;
    // role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    userId = json['userId'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['role'] = this.role;
    // if (this.role != null) {
    //   data['role'] = this.role.toJson();
    // }
    data['userId'] = this.userId;
    return data;
  }

  User.fromResponse(UserResponse user) {
    email = user.email;
    firstName = user.firstName;
    lastName = user.lastName;
    role = user.role;
    userId = user.userId;
  }
}

class Role {
  String name;
  List<Privigeles> privigeles;
  String roleId;

  Role({this.name, this.privigeles, this.roleId});

  Role.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    if (json['privigeles'] != null) {
      json['privigeles'].forEach((v) {
        privigeles.add(new Privigeles.fromJson(v));
      });
    }
    roleId = json['roleId'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    if (this.privigeles != null) {
      data['privigeles'] = this.privigeles.map((v) => v.toJson()).toList();
    }
    data['roleId'] = this.roleId;
    return data;
  }
}

class Privigeles {
  int id;
  String name;

  Privigeles({this.id, this.name});

  Privigeles.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
