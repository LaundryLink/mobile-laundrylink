import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/data/utils/resources/models/user_model.dart';
import 'package:laundry_link/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GetStorage _storage = GetStorage();

  UserLoginModel? user;
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    resetTextFields();
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

    UserLoginModel user = UserLoginModel(
        email: emailController.text, password: passwordController.text);

    try {
      Dio dio = Dio();
      final response =
          await dio.post(Resources.staticString.api_mobile + 'api/users/login',
              data: user.toJson(),
              options: Options(
                  headers: {'Content-Type': 'application/json'},
                  validateStatus: (status) {
                    // Accept all status codes, so we can handle them manually
                    return status != null && status <= 500;
                  }));

      if (response.statusCode == 200) {
        debugPrint(response.data['data']['token']);
        _storage.write('user_token',response.data['data']['token']); // Simpan token autentikasi
        Get.offAllNamed(Routes.HOME);
        Get.snackbar(
          'Welcome',
          'Login Success',
          duration: Duration(seconds: 5),
        );
      } else {
        print(response.data.toString());
        Get.snackbar(
            'Error', response.data['errors'] ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> loginUser(String email, String password) async {
  //   try {
  //     isLoading.value = true;

  //     _storage.write('user_token', _auth.currentUser!.uid); // Simpan token autentikasi

  //     Get.snackbar('Success', 'Login successful',
  //         backgroundColor: Colors.green);

  //     isLoggedIn.value = true; // Set status login menjadi true

  //     Get.offAllNamed(Routes.DASHBOARD); // Navigate ke HomePage atau ArticlePage dan hapus semua halaman sebelumnya
  //   } catch (error) {
  //     Get.snackbar('Error', 'Login failed: $error',
  //         backgroundColor: Colors.red);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
