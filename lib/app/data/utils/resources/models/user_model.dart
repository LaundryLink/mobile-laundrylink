import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String address;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "address": address,
      };
}

