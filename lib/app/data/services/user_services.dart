import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';
import '../utils/resources/app_theme.dart';

class UserServices {
  final GetStorage _storage = GetStorage();
  final Dio _dio = Dio();
  final String baseUrl =
      Resources.staticString.api_mobile + "api/users/current";

  Future<UserGet> fetchUser() async {
    try {
      final response = await _dio.get(baseUrl,
          options: Options(
              headers: { 'Authorization': _storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        debugPrint(response.data['data']);
        return userGetFromJson(response.data['data']);
        // return UserGet(
        //     id: response.data['data']['id'],
        //     fullName: response.data['data']['full_name'],
        //     email: response.data['data']['email'],
        //     phoneNumber: response.data['data']['phone_number'],
        //     address: response.data['data']['address'],
        //     role: response.data['data']['role'],
        //     eMoneyBalence: response.data['data']['e_money_balence'],
        //     membershipStatus: response.data['data']['membership_status']);
      } else {
        print(_storage.read('user_token'));
        throw Exception(response.data);
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }
}
