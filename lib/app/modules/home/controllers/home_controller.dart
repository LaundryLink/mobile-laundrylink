import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/outlet_model.dart';
import '../../../data/services/outlet_services.dart';

class HomeController extends GetxController {
  var outletsList = <Datum>[].obs;
  var isLoading = true.obs;

  final OutletsService _outletsService = OutletsService();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchOutlets();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
        for(int i = 0; i<outletsList.length; i++ ){
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
