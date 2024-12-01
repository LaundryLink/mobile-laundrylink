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
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginData data;

    LoginModel({
        required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: LoginData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class LoginData {
    String token;

    LoginData({
        required this.token,
    });

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
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

