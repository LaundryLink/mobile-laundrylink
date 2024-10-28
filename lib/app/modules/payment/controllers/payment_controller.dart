
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedIndexPickedUp = 0.obs;
  int adminPrice = 1000;
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void changeTabIndexPickedUp(int index) {
    selectedIndexPickedUp.value = index;
  }

  Color changeTabColor1() {
    return selectedIndex.value == 0 ? Colors.black : Color(0xff808080);
  }

  Color changeTabColor2() {
    return selectedIndex.value == 1 ? Colors.black : Color(0xff808080);
  }

  Color changeTabColorPickedUp1() {
    return selectedIndexPickedUp.value == 0 ? Colors.black : Color(0xff808080);
  }

  Color changeTabColorPickedUp2() {
    return selectedIndexPickedUp.value == 1 ? Colors.black : Color(0xff808080);
  }

  int calculateTotalQuantities(RxList<int> quantities) {
    return quantities.fold(0, (sum, item) => sum + item);
  }

  double calculateWeightInKg(RxList<int> quantities) {
    int total = quantities.fold(0, (sum, item) => sum + item);
    double kg = total / 8; // Pembagian desimal
    return kg; // Menampilkan 2 angka di belakang koma
  }

  double calculateLaundryPrice(
      int totalQuantities, int pricePerKg, double quantitiesPerKg) {
    // Calculate estimated weight in kilograms
    double estimatedWeight = totalQuantities / quantitiesPerKg;

    // Calculate estimated price based on weight and price per kilogram
    double estimatedPrice = estimatedWeight * pricePerKg;

    return estimatedPrice;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
