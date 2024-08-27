import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnderConstructionController extends GetxController {
  void message () {
    Get.snackbar('Sorry', 'This features is unavailable', icon: Icon(Icons.construction_outlined));
  }
}