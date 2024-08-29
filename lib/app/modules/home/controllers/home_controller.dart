import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/models/user_model.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

import '../../../data/models/outlet_model.dart';
import '../../../data/services/outlet_services.dart';
import '../../../data/services/user_services.dart';

class HomeController extends GetxController {
  var outletsList = <Datum>[].obs;
  var isLoading = true.obs;
  var imageList = <String>[
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
    'assets/images/image_caraousel.png',
  ].obs;

  var user = UserGet(
              id: 0,
              fullName: 'kosong',
              email: '',
              phoneNumber: '',
              address: '',
              eMoneyBalence: '',
              membershipStatus: '',
              role: '');

  var currentIndex = 0.obs;

  final OutletsService _outletsService = OutletsService();
  final UserServices _userService = UserServices();
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchOutlets();
    fetchUserData();
    user;
  }

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> fetchUserData() async {
    try {
      isLoading(true);
      Dio dio = Dio();
      final response =
          await dio.get(Resources.staticString.api_mobile + 'api/users/current',
              options: Options(
                  headers: {'Authorization': _storage.read('user_token')},
                  validateStatus: (status) {
                    // Accept all status codes, so we can handle them manually
                    return status != null && status <= 500;
                  }));
      if (response.statusCode == 200) {
        user.id = response.data['data']['id'];
        user.fullName = response.data['data']['full_name'];
        user.email = response.data['data']['email'];
        user.phoneNumber = response.data['data']['phone_number'];
        user.address = response.data['data']['address'];
        user.role = response.data['data']['role'];
        user.eMoneyBalence = response.data['data']['e_money_balence'];
        user.membershipStatus = response.data['data']['membership_status'];
        print(user.fullName);
      }else{
        Exception(response.data['errors']);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchOutlets() async {
    try {
      isLoading(true);
      var outlets = await _outletsService.fetchOutlets();
      if (outlets.data.isNotEmpty) {
        outletsList.assignAll(outlets.data);
      }
    } finally {
      isLoading(false);
    }
  }

  void searchOutlets(String name) async {
    try {
      isLoading(true);
      var outlets = await _outletsService.searchOutlets(name);
      if (outlets.data.isNotEmpty) {
        outletsList.assignAll(outlets.data);
        for (int i = 0; i < outletsList.length; i++) {
          debugPrint(outletsList[i].name);
          debugPrint(outletsList[i].address);
          debugPrint(outletsList[i].id.toString());
        }
      } else {
        outletsList.clear();
      }
    } finally {
      isLoading(false);
    }
  }
}
