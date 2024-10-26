import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/models/services_model.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

class ServicesOutlet {
  final GetStorage _storage = GetStorage();
  final Dio _dio = Dio();

  Future<Services> fetchServices(int outletId) async {
    final String _baseUrl =
        Resources.staticString.api_mobile + "api/outlets/${outletId}/services";
    try {
      final response = await _dio.get(_baseUrl,
          options: Options(
              headers: {'Authorization': _storage.read('user_token')},
              validateStatus: (status) {
                // Accept all status codes, so we can handle them manually
                return status != null && status <= 500;
              }));
      if (response.statusCode == 200) {
        print(response.data);
        print(outletId);
        return Services.fromJson(response.data);
      } else {
        throw Get.snackbar(
            'Error', response.data['errors'] ?? 'Unknow error occurred',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
      // throw Get.snackbar("Error", e.toString());
    }
  }
}
