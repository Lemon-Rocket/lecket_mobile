class PrivigelesResponse {
  int id;
  String name;

  PrivigelesResponse({this.id, this.name});

  PrivigelesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
