import 'package:get/get.dart';
import 'package:laundry_link/app/modules/auth/signup/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
  }
}
