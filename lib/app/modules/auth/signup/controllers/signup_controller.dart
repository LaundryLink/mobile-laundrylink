import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/utils/resources/app_theme.dart';
import '../../../../data/utils/resources/models/user_model.dart';
import '../../../../routes/app_pages.dart';

class SignupController extends GetxController {
  // Text Editing Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    resetTextFields();
    // Dispose controllers when the controller is disposed
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void resetTextFields() {
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    addressController.clear();
  }

  Future<void> register() async {
    isLoading.value = true;

    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          backgroundColor: Colors.red);
      isLoading.value = false;
      return;
    }

    // Membuat instance UserModel dari input pengguna
    UserRegisterModel user = UserRegisterModel(
      fullName: fullNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      password: passwordController.text,
      address: " ",
    );

    try {
      print(
          'nama : ${fullNameController.text} \nemail : ${emailController.text} \n phone_number : ${phoneNumberController.text} \npassword : ${passwordController.text} \naddress ${addressController.text}');

      Dio dio = Dio();
      final response = await dio.post(
        Resources.staticString.api_mobile + 'api/users',
        data: user.toJson(), // Mengirim data dalam bentuk JSON
        options: Options(
            headers: {'Content-Type': 'application/json'},
            validateStatus: (status) {
              // Accept all status codes, so we can handle them manually
              return status != null && status <= 500;
            }),
      );

      if (response.statusCode == 200) {
        // Handle success response
        Get.back();
        Get.delete<SignupController>(tag: Routes.SIGNUP);
        Get.snackbar('Success', 'User registered successfully, Please Login',
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        // Handle error response
        print(response.data.toString());
        Get.snackbar('Error', response.data['errors'] ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      // Handle network or other errors
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
