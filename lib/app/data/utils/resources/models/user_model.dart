import 'dart:convert';

UserRegisterModel userModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String address;

  UserRegisterModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.address,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
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

// model for login user
UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
    String email;
    String password;

    UserLoginModel({
        required this.email,
        required this.password,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
