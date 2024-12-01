import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:laundry_link/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/resources/app_theme.dart';

class UserServices extends GetxController {
  final GetStorage storage;
  // final SharedPreferences _prefs = Get.find<SharedPreferences>(); 
  final Dio dio;

  // Observable untuk data login
  Rx<LoginData?> loginData = Rx<LoginData?>(null);

  UserServices({required this.dio, required this.storage});

  Future<LoginData?> loginUser(Map<String, String> requestData) async {
    try {
      final response = await dio.post(
        'http://localhost:3001/api/users/login',
        data: jsonEncode(requestData),
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status != null && status <= 500,
        ),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']?['token'];
        if (token == null || token is! String) {
          throw Get.snackbar(
            'Login Error',
            'Invalid token type',
            backgroundColor: Colors.red,
          );
        }

        // Simpan token ke storage
        await storage.write('user_token', token);
        // await _prefs.setString("user_token", token);

        // Parsing data login ke model
        final parsedData = LoginModel.fromJson(response.data).data;

        // Update observable loginData
        loginData.value = parsedData;

        return parsedData;
      } else {
        throw Get.snackbar(
          'Error',
          response.data['errors'] ?? 'Unknown error occurred',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      throw Exception('Exception Error: $e');
    }
  }

  Future<dynamic> fetchUser() async {
    try {
      final response = await dio.get(
          Resources.staticString.api_mobile + 'api/users/current',
          options: Options(
              headers: {'Authorization': storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        print(storage.read('user_token'));
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
      final response = await dio.delete(
          Resources.staticString.api_mobile + 'api/users/logout',
          options: Options(
              headers: {'Authorization': storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        print("ini logout" + response.data["data"]);
        return response.data["data"];
      } else {
        Get.snackbar('Error', response.data ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print("ini bagian service ${e}");
      Get.snackbar('Error Services', 'An error occurred: $e',
          backgroundColor: Colors.red);
    }
  }
}
