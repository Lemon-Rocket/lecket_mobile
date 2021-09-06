import 'privileges_response.dart';

class RoleResponse {
  String name;
  List<PrivigelesResponse> privigeles;
  String roleId;

  RoleResponse({this.name, this.privigeles, this.roleId});

  RoleResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    if (json['privigeles'] != null) {
      json['privigeles'].forEach((v) {
        privigeles.add(PrivigelesResponse.fromJson(v));
      });
    }
    roleId = json['roleId'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (privigeles != null) {
      data['privigeles'] = privigeles.map((v) => v.toJson()).toList();
    }
    data['roleId'] = roleId;
    return data;
  }
}
