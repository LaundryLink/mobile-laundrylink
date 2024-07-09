import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/routes/app_pages.dart';

import '../../widgets/logo_laundry_link.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterSplashScreen.fadeIn(
      onInit: () {
        debugPrint("On Init");
      },
      backgroundColor: Resources.color.primaryColor,
      childWidget: LogoLaundryLink(),
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Get.offAllNamed(Routes.SIGNIN);
        }
      },
    ));
  }
}
