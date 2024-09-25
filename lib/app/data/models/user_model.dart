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

// model for get user information
UserGet userGetFromJson(String str) => UserGet.fromJson(json.decode(str));

String userGetToJson(UserGet data) => json.encode(data.toJson());

class UserGet {
    int id;
    String fullName;
    String email;
    String phoneNumber;
    String address;
    String role;
    String eMoneyBalence;
    String membershipStatus;

    UserGet({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.address,
        required this.role,
        required this.eMoneyBalence,
        required this.membershipStatus,
    });

    factory UserGet.fromJson(Map<String, dynamic> json) => UserGet(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        role: json["role"],
        eMoneyBalence: json["e_money_balence"],
        membershipStatus: json["membership_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "role": role,
        "e_money_balence": eMoneyBalence,
        "membership_status": membershipStatus,
    };
}

