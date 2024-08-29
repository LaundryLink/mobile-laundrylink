import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/routes/app_pages.dart';

import '../../auth/signin/controllers/signin_controller.dart';
import '../../widgets/logo_laundry_link.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final SigninController _authController = Get.put(SigninController());
    final GetStorage _storage = GetStorage();
    return Scaffold(
        body: FlutterSplashScreen.fadeIn(
      onInit: () {
        var token = _storage.read('user_token') != null ? _storage.read('user_token') : ''; 
        debugPrint("On Init : " + _authController.isLoggedIn.value.toString());
        debugPrint("On Init : " + token);
        _authController.checkLoginStatus();
        _authController.isLoggedIn.value;
      },
      backgroundColor: Resources.color.primaryColor,
      childWidget: LogoLaundryLink(),
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          _authController.isLoggedIn.value
              ? Get.offAllNamed(AppPages.LOGGED)
              : Get.offAllNamed(AppPages.LOGIN);
        }
      },
    ));
  }
}
