import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/home/controllers/home_controller.dart';
import 'package:laundry_link/app/modules/outlet/controllers/outlet_controller.dart';

import '../../widgets/card_outlet.dart';

class OutletListView extends GetView<OutletController> {
  const OutletListView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (homeController.outletsList.isEmpty && homeController.outletsList2.isNotEmpty) {
          return Container(padding: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            color: Colors.transparent,
            width: Get.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah item per baris
                childAspectRatio: 4 / 4, // Mengatur aspek rasio item
              ),
              itemCount: homeController.outletsList2.length,
              itemBuilder: (context, index) {
                final outlet = homeController.outletsList2[index];
                return CardOutlet(
                  outlet: outlet,
                  width: Get.width * 0.45,
                  marginLeft: 10,
                  marginRight: 10,
                  marginTop: 20,
                );
              },
            ),
          );
        } else {
          return Container(padding: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            color: Colors.transparent,
            width: Get.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah item per baris
                childAspectRatio: 4 / 4, // Mengatur aspek rasio item
              ),
              itemCount: homeController.outletsList.length,
              itemBuilder: (context, index) {
                final outlet = homeController.outletsList[index];
                return CardOutlet(
                  outlet: outlet,
                  width: Get.width * 0.45,
                  marginLeft: 10,
                  marginRight: 10,
                  marginTop: 20,
                );
              },
            ),
          );
        }
      }),
    );
  }
}
