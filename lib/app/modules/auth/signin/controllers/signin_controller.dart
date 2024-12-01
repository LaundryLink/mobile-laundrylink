import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/routes/app_pages.dart';


class SigninController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GetStorage _storage = Get.find<GetStorage>();
  final Dio _dio = Get.find<Dio>();

  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    resetTextFields();
    _storage.read("user_token");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void resetTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _storage.read('user_token') != null;
  }

  Future<void> login() async {
    isLoading.value = true;

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          backgroundColor: Colors.red);
      isLoading.value = false;
      return;
    }

    try {
      final requestData = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      final response = await _dio.post(
        '${Resources.staticString.api_mobile}api/users/login',
        data: requestData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status != null && status <= 500,
        ),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']?['token'];
        if (token == null || token is! String) {
          throw Exception('Invalid token format in response');
        }

        await _storage.write('user_token', token);
        Get.offAllNamed(Routes.NAVBAR);
        Get.snackbar('Welcome', 'Login Success', duration: Duration(seconds: 5));
      } else {
        final errorMessage = response.data?['message'] ?? 'Unknown error occurred';
        throw Exception('Login failed: $errorMessage');
      }
    } catch (e) {
      // Get.snackbar('Error', 'An error occurred: $e',
      //     backgroundColor: Colors.red);
      throw Exception("error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
