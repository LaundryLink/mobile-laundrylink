import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/user_model.dart';
import '../../../data/services/user_services.dart';

class ProfileController extends GetxController {
  final UserServices _userService = UserServices();
  final GetStorage _storage = GetStorage();

  var user = UserGet(
      id: 0,
      fullName: 'kosong',
      email: '',
      phoneNumber: '',
      address: '',
      eMoneyBalence: '',
      membershipStatus: '',
      role: '');

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void fetchUserData() async {
    try {
      isLoading(true);
      var userData = await _userService.fetchUser();
      user.id = userData['data']['id'];
      user.fullName = userData['data']['full_name'];
      user.email = userData['data']['email'];
      user.phoneNumber = userData['data']['phone_number'];
      user.address = userData['data']['address'];
      user.role = userData['data']['role'];
      user.eMoneyBalence = userData['data']['e_money_balence'];
      user.membershipStatus = userData['data']['membership_status'];

      user.membershipStatus = user.membershipStatus[0].toUpperCase() + user.membershipStatus.substring(1).toLowerCase();

      debugPrint("ini di home" + userData['data']['full_name']);
      debugPrint("ini di home 1 " + user.membershipStatus);
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void logoutUser() {
    try {
      _userService.logoutUser(); 
      _storage.remove('user_token');
      Get.snackbar("Logout", "Logout Success");
    } catch (e) {
      Get.snackbar('Error controller', 'An error occurred: $e', backgroundColor: Colors.red);
    }
  }
}
