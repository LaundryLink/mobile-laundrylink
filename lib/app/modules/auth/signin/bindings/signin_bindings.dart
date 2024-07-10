import 'package:get/get.dart';
import 'package:laundry_link/app/modules/auth/signin/controllers/signin_controller.dart';

class SigninBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
