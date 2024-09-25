import 'package:get/get.dart';
import 'package:laundry_link/app/modules/auth/signin/bindings/signin_bindings.dart';
import 'package:laundry_link/app/modules/auth/signin/views/signin_form_view.dart';
import 'package:laundry_link/app/modules/auth/signin/views/signin_view.dart';
import 'package:laundry_link/app/modules/auth/signup/bindings/signup_binding.dart';
import 'package:laundry_link/app/modules/auth/signup/views/signup_view.dart';
import 'package:laundry_link/app/modules/home/views/bottom_nav_bar.dart';
import 'package:laundry_link/app/modules/outlet/bindings/outlet_binding.dart';
import 'package:laundry_link/app/modules/outlet/views/outlet_detail_view.dart';
import 'package:laundry_link/app/modules/outlet/views/outlet_list_view.dart';
import 'package:laundry_link/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:laundry_link/app/modules/widgets/under_construction_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const LOGGED = Routes.NAVBAR;
  static const LOGIN = Routes.SIGNIN;

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
        binding: SigninBindings()),
    GetPage(
        name: _Paths.NAVBAR,
        page: () => BottomNavBar(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.DETAILOUTLET,
        page: () => OutletDetailView(outlet: Get.arguments,),
        binding: OutletBinding()),
    GetPage(
        name: _Paths.LISTLOUTLET,
        page: () => OutletListView(),
        binding: OutletBinding(),
        arguments: Get.arguments),
    GetPage(name: _Paths.CONSTRUCTION, page: () => UnderConstructionView()),
  ];
}
