// lib/services/outlets_service.dart
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../models/outlet_model.dart';
import '../utils/resources/app_theme.dart';

class OutletsService {
  final GetStorage _storage = GetStorage();
  final Dio _dio = Dio();
  final String baseUrl = Resources.staticString.api_mobile + "api/outlets";

  Future<Outlets> fetchOutlets() async {
    try {
      final response = await _dio.get(baseUrl,
          options:
              Options(headers: {'Authorization': _storage.read('user_token')}));
      if (response.statusCode == 200) {
        return Outlets.fromJson(response.data);
      } else {
        throw Exception("Failed to load outlets");
      }
    } catch (e) {
      throw Exception("Failed to load outlets: $e");
    }
  }

  Future<Outlets> searchOutlets(String name) async {
    try {
      final response = await _dio.get(baseUrl,
          queryParameters: {
            "name": name,
          },
          options:
              Options(headers: {'Authorization': _storage.read('user_token')}));
      if (response.statusCode == 200) {
        return Outlets.fromJson(response.data);
      } else {
        throw Exception("Failed to search outlets");
      }
    } catch (e) {
      throw Exception("Failed to search outlets: $e");
    }
  }
}
