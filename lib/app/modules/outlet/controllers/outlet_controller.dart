import 'package:get/get.dart';
import 'package:laundry_link/app/data/models/outlet_model.dart';
import 'package:laundry_link/app/data/models/services_model.dart';
import 'package:laundry_link/app/data/services/services_oulet_services.dart';

class OutletController extends GetxController {
  final ServicesOutlet _servicesOutlet = ServicesOutlet();
  late Datum outlet;
  OutletController(this.outlet);

  var totalPrice = 0.obs;
  var quantities = <int>[].obs;
  var quantitiesPerItem = <int>[].obs;
  var pricePerItem = 500;
  var serviceOutletData = <Service>[].obs;
  var isLoading = true.obs;
  var iconServiceList = <String>[
    'assets/svg/icon_tshirt.svg',
    'assets/svg/blanket.svg',
    'assets/svg/ironing.svg',
    'assets/svg/shoes.svg',
    'assets/svg/dry.svg'
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchServicesOutlet();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchServicesOutlet();
    calculateTotalPrice();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    fetchServicesOutlet();
  }

  void fetchServicesOutlet() async {
    try {
      var serviceOutlet = await _servicesOutlet.fetchServices(outlet.id);
      var availableServices = serviceOutlet.data
          .where((service) => service.serviceEnable)
          .toList();
      if (availableServices.isNotEmpty) {
        return serviceOutletData.assignAll(availableServices);
      }
    } finally {
      isLoading(false);
    }
  }

  void updateQuantity(int index, int quantity) {
    quantities[index] = quantity;
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice.value =
        quantities.fold(0, (sum, quantity) => sum + (quantity * pricePerItem));
  }

  void initializeQuantities(int length) {
    quantities.value = List<int>.filled(length, 0);
  }
}
