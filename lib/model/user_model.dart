import 'dart:convert';

List<UserModel> userModelFromJson(String str) {
  return List<UserModel>.from(
    json.decode(str).map(
          (element) => UserModel.fromMap(element),
        ),
  );
}

class UserModel {
  int id;
  String username;
  String email;
  String phone;
  String website;

  UserModel(
      {required this.username,
      required this.id,
      required this.email,
      required this.website,
      required this.phone});

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website']);
}
