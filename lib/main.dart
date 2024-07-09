import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Resources.color.primaryColor,
      title: "Laundry Link",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
