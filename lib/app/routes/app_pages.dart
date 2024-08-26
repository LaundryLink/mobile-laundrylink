import 'package:get/get.dart';
import 'package:laundry_link/app/modules/auth/signin/bindings/signin_bindings.dart';
import 'package:laundry_link/app/modules/auth/signin/views/signin_form_view.dart';
import 'package:laundry_link/app/modules/auth/signin/views/signin_view.dart';
import 'package:laundry_link/app/modules/auth/signup/bindings/signup_binding.dart';
import 'package:laundry_link/app/modules/auth/signup/views/signup_view.dart';
import 'package:laundry_link/app/modules/splash_screen/views/splash_screen_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: _Paths.SPLASH, page: () => const SplashScreenView()),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
    ),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => SignupView(),
        binding: SignupBinding()),
    GetPage(
        name: _Paths.SIGNINFORM,
        page: () => SigninFormView(),
        binding: SigninBindings())
  ];
}
