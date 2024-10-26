import 'package:get/get.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';

class OutletBinding extends Bindings {
  @override
  void dependencies() {
    var outlet = Get.arguments;
    Get.lazyPut<OutletController>(() => OutletController(outlet));
  }
}
