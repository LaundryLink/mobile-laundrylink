import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Resources.color.primaryColor,
      title: "Laundry Link",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  });
  
}
