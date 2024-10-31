

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/resources/app_theme.dart';

class UserServices {
  final GetStorage _storage = GetStorage();
  final Dio _dio = Dio();

  Future<dynamic> fetchUser() async {
    try {
      final response = await _dio.get(
          Resources.staticString.api_mobile + 'api/users/current',
          options: Options(
              headers: {'Authorization': _storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        print(_storage.read('user_token'));
        Get.snackbar(
            'Error', response.data['errors'] ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    }
  }

  Future<void> logoutUser() async {
    try {
      final response = await _dio.delete(
          Resources.staticString.api_mobile + 'api/users/logout',
          options: Options(
              headers: {'Authorization': _storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        
        print("ini logout" +  response.data["data"]);
        return response.data["data"];
      } else {
        Get.snackbar(
            'Error', response.data ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print("ini bagian service ${e}");
      Get.snackbar('Error Services', 'An error occurred: $e', backgroundColor: Colors.red);
    }
  }
}
